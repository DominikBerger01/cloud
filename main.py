import json


def hello_world(event, context):
    print(f'Event: {event} \n')
    print(f'Context: {context}')

    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json',
        },
        'body': json.dumps({'message': 'Hello World!'})
    }