package demoKarateAPI;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class DemoTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:demoKarateAPI")
                //.outputCucumberJson(true)
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
