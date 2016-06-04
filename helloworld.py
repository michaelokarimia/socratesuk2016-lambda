def lambda_handler(event, context):
    return "Hello {}!".format(event['to'])
