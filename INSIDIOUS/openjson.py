import json
from firebase import firebase

firestore = firebase.FirebaseApplication('https://insidious-d046b.firebaseio.com/', None)

def add_to_DB(data_dict):
    for tool, res in zip(list(data_dict.keys()), list(data_dict.values())):
        firestore.put('/{}/'.format(tool), 'result', res)
    print('Database Updated')

with open('./output/result.json', 'r') as fp:
	data_dict=json.load(fp)
        add_to_DB(data_dict)
