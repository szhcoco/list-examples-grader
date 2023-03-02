CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -f ListExamples.java ]]
then 
    echo 'We found the file'
else
    echo 'We did not find it'
fi

cp ../TestListExamples.java ./
cp -r ../lib ./
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
RESULT = 'echo $?'
if [[ $RESULT -eq 0 ]]
then 
    echo 'Compile successfully'
else 
    RESULT > out.txt 2>&1
    cat out.txt
fi

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples 2> error.txt

cat error.txt
