import XCTest
@testable import Recipit

class YummlySessionTestsCase: XCTestCase {
    
////// Tests of getRecipes //////////////////
    func testGetRecipesShouldPostFailedCallbackIfError () {
        let fakeResponse = FakeResponse(response: nil, data: nil, error: FakeResponseData.networkError)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
      
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipes { (succes, RecipesData) in
  
            XCTAssertFalse(succes)
            XCTAssertNil(RecipesData)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetRecipesShouldPostFailedCallbackIfNoData () {
        let fakeResponse = FakeResponse(response: nil, data: nil, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipes { (succes, RecipesData) in
            
            XCTAssertFalse(succes)
            XCTAssertNil(RecipesData)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetRecipesShouldPostFailedCallbackIfInconrectResponse () {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseKO, data: nil , error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipes { (succes, RecipesData) in
            
            XCTAssertFalse(succes)
            XCTAssertNil(RecipesData)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetRecipesShouldPostFailedCallbackIfIncorrectData () {
        let fakeResponse = FakeResponse(response: nil, data: FakeResponseData.incorrectData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipes { (succes, RecipesData) in
            
            XCTAssertFalse(succes)
            XCTAssertNil(RecipesData)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetRecipesShouldPostFailedCallbackIfInccorectDataAndincorrectResponse () {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK ,data: FakeResponseData.incorrectData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
       
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipes { (succes, RecipesData) in
            
            XCTAssertFalse(succes)
            XCTAssertNil(RecipesData)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }

    func testGetRecipesShouldPostSuccesCallbackIfNoErrorAndCorrectData () {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: FakeResponseData.correctData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipes { (succes, RecipesData) in
            let text = "Quinoa Tabbouleh Salad"
            XCTAssertTrue(succes)
            XCTAssertNotNil(RecipesData)
            XCTAssertEqual(text, RecipesData?.matches[0].recipeName)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
////// Tests of getRecipeDetails //////////////////}
    
    func testGetRecipeDetailsShouldPostFailedCallbackIfError () {
        let fakeResponse = FakeResponse(response: nil, data: nil, error: FakeResponseData.networkError)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipeDetails { (succes, RecipesData) in
            
            XCTAssertFalse(succes)
            XCTAssertNil(RecipesData)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetRecipeDetailsShouldPostFailedCallbackIfNoData () {
        let fakeResponse = FakeResponse(response: nil, data: nil, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipeDetails { (succes, RecipesData) in
            
            XCTAssertFalse(succes)
            XCTAssertNil(RecipesData)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetRecipeDetailsShouldPostFailedCallbackIfInconrectResponse () {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseKO, data: nil , error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipeDetails { (succes, RecipesData) in
            
            XCTAssertFalse(succes)
            XCTAssertNil(RecipesData)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetRecipeDetailsShouldPostFailedCallbackIfIncorrectData () {
        let fakeResponse = FakeResponse(response: nil, data: FakeResponseData.incorrectData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipeDetails { (succes, RecipesData) in
            
            XCTAssertFalse(succes)
            XCTAssertNil(RecipesData)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetRecipeDetailsShouldPostFailedCallbackIfInccorectDataAndincorrectResponse () {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK ,data: FakeResponseData.incorrectData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipeDetails { (succes, RecipesData) in
            
            XCTAssertFalse(succes)
            XCTAssertNil(RecipesData)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetRecipeDetailsShouldPostSuccesCallbackIfNoErrorAndCorrectData () {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: FakeResponseData.correctDetailsData, error: nil)
        let yummlySessionFake = YummlySessionFake(fakeResponse: fakeResponse)
        let yummlyService = YummlyService(yummlySession: yummlySessionFake)
        
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        yummlyService.getRecipeDetails { (succes, RecipesData) in
            let text = ["Chicken thighs- 1 package",
                "Dijon mustard- 1/2 cup",
                "Maple syrup- 1/4 cup",
                "Rice/rice wine vinegar- 1 tablespoon",
                "Fresh rosemary",
                "Salt and pepper",
                "Salt and pepper"]
            XCTAssertTrue(succes)
            XCTAssertNotNil(RecipesData)
            XCTAssertEqual(text, RecipesData?.ingredientLines)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
}
