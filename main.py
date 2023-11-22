import json


def hello_world(event, context):
    print(f'Event: {event} \n')
    print(f'Context: {context}')

    return json.dumps({
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json',
        },
        'body': {'message': 'Hello World!'}
    })