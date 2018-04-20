import ModerateQuestions
import XCTest

class ModerateTests: XCTestCase {

    /**
     16.1: Number Swapper

     Wite a function to swap a number in place (that is, without temporary variable).
    */
    func test_16_1_NumberSwap() {
      var a = 1
      var b = 5
      numberSwap(&a, &b)
      XCTAssertEqual(a, 5)
      XCTAssertEqual(b, 1)

      a = -3
      b = -10
      numberSwap(&a, &b)
      XCTAssertEqual(a, -10)
      XCTAssertEqual(b, -3)
    }

    /**
     16.2: Word Frequencies

     Design a method to find the frequency of occurrences of any given word in a book. What if we were running this algorithm multiple times?
    */
    func test_16_2_WordFrequencies() {
        let book = """
        Lorem ipsum dolor sit amet, etiam et consectetuer et, ipsum consequat mauris sed parturient, in nec nibh velit adipiscing penatibus sed, integer faucibus bibendum turpis ut proin, mauris nulla elit dui ultrices justo. Ultricies sed vitae vel. Amet tempus consectetuer nam fusce mattis, duis ligula fusce accusamus curabitur semper fusce, sodales ultrices vehicula natoque nisl quis, nec magna urna dis sit, volutpat suspendisse venenatis mi amet eu vehicula. Id nunc, morbi ratione a sit, placerat sollicitudin nunc, ut mi vehicula in eu blandit vitae. Id mollis felis ipsum nulla, magna maecenas sagittis vestibulum, eu in donec justo, est amet volutpat quisque suspendisse, nec luctus integer libero vitae lorem molestie. Pellentesque turpis assumenda ut ipsum nullam ut, habitant imperdiet tincidunt nisl. Dolor ac, arcu cupiditate id ultrices sociis velit in. Risus pharetra eleifend. Dictum enim tortor in vestibulum, donec libero.
        """.components(separatedBy: [" ", ".", ","])
        XCTAssertEqual(wordFreq("in", from: book), 5)
        XCTAssertEqual(wordFreq("ipsum", from: book), 4)
        XCTAssertEqual(wordFreq("lorem", from: book), 2)
    }

    /**
     16.5: Factorial Zeros

     Write an algorithm which computes the number of trailing zeros in n factorial
    */
    func test_16_3_CountZeroFactorial() {
        XCTAssertEqual(countZeroFactorial(1), 0)
        XCTAssertEqual(countZeroFactorial(6), 1)
        XCTAssertEqual(countZeroFactorial(28), 6)
        XCTAssertEqual(countZeroFactorial(129), 31)
    }

    /**
     16.6: Smallest Difference

     Given two arrays of integers, compute the pair of values (one value in each array) with the smallest (non-negative) difference. Return the difference.
    */
    func test_16_4_FindMinDiff() {
        XCTAssertNil(minDiff([], []))
        XCTAssertEqual(minDiff([1, 3, 15, 11, 2], [23, 127, 235, 19, 8]), 3)
        XCTAssertEqual(minDiff([1, 3, 15, 11], [23, 235, 15, 19, 8]), 0)
    }

    /**
     16.15: Master Mind

     The Game of Master Mind is played as follows:
     
     The computer has four slots, and each slot will contain a ball that is red (R), yellow (Y), green (G) or blue (B). For example, the computer might have RGGB (Slot #1 is red, Slots #2 and #3 are green, Slot #4 is blue).

     When you guess the correct color for the correct slot, you get a "hit". If you guess a color taht exists but is in the wrong slot, you get a "pseudo-hit". Note that a slot that is a hit can never count as a pseudo-hit.

     For example, if the actual solution is RGBY and you guess GGRR, you have one hit and one pseudo-hit.

     Write a method that, given a guess and a solution, retruns the number of hits and pseudo-hits.
    */
    func test_16_15_MasterMind() {
        // tuple of (hit, pseudo-hit)
        XCTAssert(masterMind(solution: "RGBY", guess: "RGBY") == (4, 0))
        XCTAssert(masterMind(solution: "RGBY", guess: "GBYR") == (0, 4))
        XCTAssert(masterMind(solution: "RGBB", guess: "YYYY") == (0, 0))
        XCTAssert(masterMind(solution: "RGBY", guess: "GGRR") == (1, 1))
        XCTAssert(masterMind(solution: "RGGB", guess: "YRGB") == (2, 1))
    }

    /**
     16.19: Pond Sizes

    You have an integer matrix representing a plot of land, where the value at that location represents the height above sea level. A value of zero indicates water. A pond is a region of water connected vertically, horizontally, or diagonally. The size of the pond is the total number of connected water cells. Write a method to compute the sizes of all ponds in the matrix.
    */
    func test_16_19_PondSize() {
        var pond = [
            [0, 2, 1, 0],
            [0, 1, 0, 1],
            [1, 1, 0, 1],
            [0, 1, 0, 1]
        ]
        XCTAssertEqual(getPondSizes(&pond), [1, 2, 4])

        var emptyPond: [[Int]] = []
        XCTAssertEqual(getPondSizes(&emptyPond), [])

        var pond1 = [[0]]
        XCTAssertEqual(getPondSizes(&pond1), [1])

        var pond2 = [[1]]
        XCTAssertEqual(getPondSizes(&pond2), [])
    }
}