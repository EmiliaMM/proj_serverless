import boto3

client = boto3.client('s3', region_name='us-east-1', endpoint_url='http://s3.localhost.localstack.cloud:4566')

def create_bucket(bucket_name):
    response = client.create_bucket(
    Bucket=bucket_name)


def put_bucket_policy(bucket_name):
    response = client.put_bucket_policy(
    Bucket=bucket_name,
    Policy='{"Version": "2012-10-17", "Statement": [{ "Sid": "PublicReadGetObject","Effect": "Allow","Principal": "*","Action": "s3:GetObject","Resource": "arn:aws:s3:::MY_BUCKET_NAME/*" } ]}',
)


def main():
    
    bucket_name = "boto3-em"
    s3 = create_bucket(bucket_name)
    
   

if __name__ == "__main__":
    main()
