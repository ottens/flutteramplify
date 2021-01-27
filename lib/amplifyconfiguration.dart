const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "flutteramplify": {
                    "endpointType": "GraphQL",
                    "region": "us-east-1",
                    "authorizationType": "AMAZON_COGNITO_USER_POOLS"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "flutteramplify185e7f83468a4b20a7fc6a5f92a3406111003-dev",
                "region": "us-east-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';