#!/usr/bin/env python3
# --encoding:utf8--
import os
import sys
import math

"""
TODO:
- si le messsage du commit contient quelques mot clé que je définie:
je propose quelques emojis en priorité
"""

sys.stdout = sys.stderr  # sinon stdout n'est pas visible, si lancer depuis un autre script sh

"""
name_emoji:
	- doc: blabla
	- byte_code: 😎
"""

dict_emoji = {
    'adhesive_bandage': {'byte_code': '🩹', 'doc': 'Non-critical fix'},
    'alembic': {'byte_code': '⚗ ', 'doc': 'Perform experiment'},
    'alien': {'byte_code': '👽', 'doc': 'Update code due to external API'},
    'ambulance': {'byte_code': '🚑', 'doc': 'Critical hotfix'},
    'apple': {'byte_code': '🍎', 'doc': 'Fixing on MacOS'},
    'arrow_down': {'byte_code': '⬇️ ', 'doc': 'Downgrading dependencies'},
    'arrow_up': {'byte_code': '⬆️ ', 'doc': 'Upgrading dependencies'},
    'art': {'byte_code': '🎨', 'doc': 'Improve structure format of the code'},
    'beers': {'byte_code': '🍻', 'doc': 'Write code drunkenly'},
    'bento': {'byte_code': '🍱', 'doc': 'Add or update assets'},
    'bookmark': {'byte_code': '🔖', 'doc': 'Version tag'},
    'books': {'byte_code': '📚', 'doc': 'Documentation'},
    'boom': {'byte_code': '💥', 'doc': 'Breaking changes'},
    'bug': {'byte_code': '🐛', 'doc': 'Bugfix'},
    'building_construction': {'byte_code': '🏗 ', 'doc': 'Make architectural changes'},
    'bulb': {'byte_code': '💡', 'doc': 'Documenting source code'},
    'camera_flash': {'byte_code': '📸', 'doc': 'Add or update snapshots'},
    'card_file_box': {'byte_code': '🗃 ', 'doc': 'Perform database related changes'},
    'card_index': {'byte_code': '📇', 'doc': 'Metadata'},
    'chart_with_upwards_trend': {'byte_code': '📈', 'doc': 'Analytics or tracking code'},
    'checkered_flag': {'byte_code': '🏁', 'doc': 'Fixing on Windows'},
    'children_crossing': {'byte_code': '🚸', 'doc': 'Improve user experience usability'},
    'construction': {'byte_code': '🚧', 'doc': 'Work in progress'},
    'construction_worker': {'byte_code': '👷', 'doc': 'Adding CI build system'},
    'face_vomiting': {'byte_code': '🤮', 'doc': 'Bad code / need improv'},
    'fire': {'byte_code': '🔥', 'doc': 'Removing code/files'},
    'globe_with_meridians': {'byte_code': '🌐', 'doc': 'Translation'},
    'green_heart': {'byte_code': '💚', 'doc': 'Continuous Integration'},
    'hammer': {'byte_code': '🔨', 'doc': 'Add or update development scripts'},
    'heavy_minus_sign': {'byte_code': '➖', 'doc': 'Removing a dependency'},
    'heavy_plus_sign': {'byte_code': '➕', 'doc': 'Adding a dependency'},
    'iphone': {'byte_code': '📱', 'doc': 'Work on responsive design'},
    'lipstick': {'byte_code': '💄', 'doc': 'Cosmetic'},
    'lock': {'byte_code': '🔒', 'doc': 'Security'},
    'ok_hand': {'byte_code': '👌', 'doc': 'Code review changes'},
    'package': {'byte_code': '📦', 'doc': 'Package.json in JS'},
    'passport_control': {'byte_code': '🛂', 'doc': 'Related to authorization, roles and permissions'},
    'pencil': {'byte_code': '📝', 'doc': 'Text'},
    'penguin': {'byte_code': '🐧', 'doc': 'Fixing on Linux'},
    'racehorse': {'byte_code': '🏇', 'doc': 'Performance'},
    'recycle': {'byte_code': '♻️ ', 'doc': 'Refactor code'},
    'rewind': {'byte_code': '⏪️', 'doc': 'Revert changes'},
    'rocket': {'byte_code': '🚀', 'doc': 'Deploying stuff'},
    'rotating_light': {'byte_code': '🚨', 'doc': 'Compiler / linter warnings'},
    'see_no_evil': {'byte_code': '🙈', 'doc': 'Add or update a .gitignore file'},
    'sparkles': {'byte_code': '✨', 'doc': 'New feature'},
    'speech_balloon': {'byte_code': '💬', 'doc': 'Add or update text and literals'},
    'sunglasses': {'byte_code': '😎', 'doc': 'Lint'},
    'tada': {'byte_code': '🎉', 'doc': 'Initial commit'},
    'truck': {'byte_code': '🚚', 'doc': 'Move / rename folder'},
    'twisted_rightwards_arrows': {'byte_code': '🔀', 'doc': 'Merging branches'},
    'wastebasket': {'byte_code': '🗑 ', 'doc': 'Deprecate code'},
    'whale': {'byte_code': '🐳', 'doc': 'Docker'},
    'wheelchair': {'byte_code': '♿', 'doc': 'Accessibility'},
    'white_check_mark': {'byte_code': '✅', 'doc': 'Adding or Update a test'},
    'wrench': {'byte_code': '🔧', 'doc': 'Configuration files'},
    'zap': {'byte_code': '⚡️', 'doc': 'General update'},
}


def parse_GitCommitEmoji():
    global dict_emoji
    with open("GitCommitEmoji.md", 'r') as f:
        lines = f.readlines()[6:-1]
        for line in lines:
            doc_emoji, emoji = line.split("|")[1:3]
            doc_emoji = doc_emoji.strip()
            emoji = emoji.strip().replace(":", "").replace("`", "")

            # Si il y a 2 emojis possible
            if " or " in emoji:
                emoji, emoji_secondary = emoji.split(" or ")
                byte_code_secondary, name_emoji_secondary = emoji_secondary.split()
                dict_emoji[name_emoji_secondary] = {"doc": doc_emoji, "byte_code": byte_code_secondary}

            byte_code, name_emoji = emoji.split()
            dict_emoji[name_emoji] = {"doc": doc_emoji, "byte_code": byte_code}


def choose_emoji():
    """Renvoie le caractère de l'emoji choisie"""
    global dict_emoji
    print("🎯 Choose an emoji for your commit:")
    ####
    # Print all emojis in grid (2 col)
    list_txt = []
    keys_enum = {(i + 1): key for i, key in enumerate(dict_emoji)}
    for i, key in keys_enum.items():
        emoji = dict_emoji[key]['byte_code']
        doc_emoji = dict_emoji[key]['doc']
        offset = math.log10(len(dict_emoji))
        list_txt.append(f"{i:2}. {emoji}: {doc_emoji}")
    full_txt = ""
    nb_rows = (len(list_txt) // 2) + (len(list_txt) % 2)  # quotient + reste = nombre de ligne nécessaire
    nb_emoji_is_odd = len(list_txt) % 2
    if nb_emoji_is_odd:  # Si il y a un nombre impaire d'emoji
        nb_rows -= 1
    for index_txt in range(nb_rows):  # il faut utiliser i et i + nb_rows sur une ligne
        # shit code for align column in my terminal
        if index_txt+1 in [6, 7]:
            full_txt += f"{list_txt[index_txt]:40}\t\t{list_txt[index_txt + nb_rows]}\n"
        else:
            full_txt += f"{list_txt[index_txt]:40}\t{list_txt[index_txt + nb_rows]}\n"
    if nb_emoji_is_odd:
        full_txt += str(list_txt[-1]) + '\n'
    print(full_txt)
    ####
    index_choose = int(input("Choice: "))
    while index_choose not in keys_enum:
        # Attention l'emoji: "⚠️" prend la place de 2 caractères mais n'en est qu'un seul,
        # il doit donc être suivie d'au moins 1 espace
        print(f"⚠️  Choose a number between 1 and {len(keys_enum)} (include)")
        index_choose = int(input("Choice: "))
    return dict_emoji[keys_enum[index_choose]]["byte_code"]


def add_emoji_to_commit(msg: str):
    global dict_emoji
    emoji = choose_emoji()
    if emoji is None:
        full_msg = msg
    else:
        full_msg = emoji + " " + msg
    print("Your commit message is:", full_msg)
    confirm = input("Add emoji ? [y]/n ").lower()
    if confirm == "" or confirm == "y" or confirm == "yes":
        return full_msg
    return msg


def main():
    original_msg = sys.argv[2]
    msg = add_emoji_to_commit(original_msg)
    if sys.argv[1] == "signed":
        os.system(f"git commit --gpg-sign --message '{msg}'")
    else:
        os.system(f"git commit --message {msg}")


main()

