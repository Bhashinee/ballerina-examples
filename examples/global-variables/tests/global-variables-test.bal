import ballerina/test;
import ballerina/io;

any [] outputs = [];
int counter = 0;
 // This is the mock function which will replace the real function
@test:Mock {
    packageName : "ballerina.io" ,
    functionName : "println"
}
public function mockPrint (any s) {
    outputs[counter] = s;
    counter++;
}

@test:Config
function testFunc() {
    // Invoking the main function
    main([]);
    test:assertEquals(98, outputs[0]);
    test:assertEquals("This is a sample text", outputs[1]);
}
