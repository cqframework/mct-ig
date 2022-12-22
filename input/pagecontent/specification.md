## Introduction

### Use Case

### Prototype Sequence Diagram

### Prototype Interaction Specifications

### Validation Sequence Diagram

### Validation Interaction Specifications

### Measure Content

### Terminology Content

### Unit Tests

### Test Data Generation

The test data generation for CMS104 is achieved by running the _generateTestData script found at the root of this project. 
This script evaluates the CMS104TestDataGenerator CQL library to generate the necessary QiCore profiles, populates those 
resources into a transaction Bundle, and writes the Bundle resource to the input/tests directory.

#### Adding a New Test Case

To add a new test case simply add an expression to the CMS104TestDataGenerator.cql library using the specified builder functions 
to generate the necessary resources. There are two simple examples currently in that library to get you started. Note that the 
name of the expression will be used as the name for the sub-directory and filename for the output.

#### Running the Test Data Generation Script

The _generateTestData script is executed from the command line with the command `sh _generateTestData.sh`. Currently only a 
shell script has been authored. Including a Batch (.bat) script is on the road map to better support Windows users. In order 
to run the shell script, your environment must support `sh` (UNIX command language interpreter), `curl` (command that enables 
data exchange to or from a server), and `jq` (command line JSON processor) commands. These can be easily installed on Mac using 
[Homebrew](https://brew.sh) from the command line (e.g. `brew install curl` or `brew install jq`).

#### Output

After successfully running the _generateTestData script, the test data will be written to the input/tests directory of this 
project. Each named expression in the CMS104TestDataGenerator library will generate a sub-directory within the input/tests 
directory containing a JSON file with a [transaction](http://hl7.org/fhir/http.html#transaction) bundle containing the test 
data. The name of the CQL named expression will be used for both the sub-directory and JSON filename.