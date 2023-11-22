import json


def hello_world(request):
    print(request)

    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json',
        },
        'body': json.dumps(
            {'message': '<h1> Hello World! </h1>'}
        )
    }
