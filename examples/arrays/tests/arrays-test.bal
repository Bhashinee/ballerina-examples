import ballerina/test;
import ballerina/io;

any [] outputs = [];
int count = 0;
 // This is the mock function which will replace the real function
@test:Mock {
    packageName : "ballerina.io" ,
    functionName : "println"
}
public function mockPrint (any s) {
    outputs[count] = s;
    count++;
}

@test:Config
function testFunc() {
    // Invoking the main function
    main([]);
    test:assertEquals(0, outputs[0]);
    test:assertEquals(8, outputs[1]);
    test:assertEquals(23, outputs[2]);
    test:assertEquals(1000, outputs[3]);
}
