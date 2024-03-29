provider "aws" {
	region = "eu-west-1"
	profile = "srathan-terraformcourse"
}

resource "aws_s3_bucket" "mybucket" {
	bucket = "mybucket-tfcourse-101118"
	acl = "private"
	region = "eu-west-1"

	tags {
		Environment = "Dev"
	}
}

resource "aws_s3_bucket_object" "myfirstobject" {
  bucket = "${aws_s3_bucket.mybucket.id}"
  key    = "testfile.txt"
  source = "../testfiles/sampleobject.txt"
  etag   = "${md5(file("../testfiles/sampleobject.txt"))}"
}