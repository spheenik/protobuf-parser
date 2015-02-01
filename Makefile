ifeq ($(uname),Darwin)
FLAGS += -arch i386
endif

target/sampleparser.jar :
	@mvn package

testparsersimple : target/sampleparser.one-jar.jar
	@java -jar target/sampleparser.one-jar.jar protos/*.proto

testparserverbose : target/sampleparser.one-jar.jar
	@java -jar target/sampleparser.one-jar.jar protos/*.proto -t

testprotos :
	@if [ -d output ]; then true; else mkdir output; fi
	@protoc --proto_path=/opt/local/include:protos/:. --java_out=./output/ --cpp_out=./output/ --python_out=./output/ protos/*.proto
	@rm -rf ./output
