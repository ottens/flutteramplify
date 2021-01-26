const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "myamplifyproject": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://fxumj75lnvhl3onfy66rkctsn4.appsync-api.us-east-1.amazonaws.com/graphql",
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
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:ae82769d-d4d4-4976-9530-1b5adb3d65f3",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_841pvxGaW",
                        "AppClientId": "4un9vo8h4fa94rbgubmn78uaps",
                        "AppClientSecret": "aa68blom014dhrp23cotavg5tuqp264oqgrofb10p3mi9p5jjuk",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://fxumj75lnvhl3onfy66rkctsn4.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "myamplifyproject_AMAZON_COGNITO_USER_POOLS"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "myamplifyproject185e7f83468a4b20a7fc6a5f92a3406111003-dev",
                "region": "us-east-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';