Test Class:
@isTest
public class SurveyFeedbackLWCTest {

    static testMethod void connectedCallbackTest() {
        Test.startTest();
        // setup test data
        Id surveyId = '';

        // create the component
        SurveyFeedbackLWC component = new SurveyFeedbackLWC();
        component.surveyId = surveyId;

        // execute the connectedCallback
        component.connectedCallback();

        // assert that the questions have been retrieved
        System.assert(component.questions != null, 'Questions should have been retrieved');

        Test.stopTest();
    }

    static testMethod void handleQuestionTypeChangeTest() {
        Test.startTest();
        // setup test data
        Id surveyId = '';
        Id questionId = '';
        String questionType = '';

        // create the component
        SurveyFeedbackLWC component = new SurveyFeedbackLWC();
        component.surveyId = surveyId;

        // execute the handleQuestionTypeChange
        component.handleQuestionTypeChange(questionId, questionType);

        // assert that the question choices have been retrieved
        System.assert(component.questionChoices != null, 'Question choices should have been retrieved');

        Test.stopTest();
    }

    static testMethod void handleAnswerChangeTest() {
        Test.startTest();
        // setup test data
        Id questionId = '';
        Id answerId = '';

        // create the component
        SurveyFeedbackLWC component = new SurveyFeedbackLWC();

        // execute the handleAnswerChange
        component.handleAnswerChange(questionId, answerId);

        // assert that the answer has been saved
        System.assertEquals(component.surveyResponse[0].questionId, questionId, 'Question ID should match');
        System.assertEquals(component.surveyResponse[0].answerId, answerId, 'Answer ID should match');

        Test.stopTest();
    }

    static testMethod void handleSubmitTest() {
        Test.startTest();
        // setup test data
        List<Object> surveyResponse = new List<Object>();

        // create the component
        SurveyFeedbackLWC component = new SurveyFeedbackLWC();
        component.surveyResponse = surveyResponse;

        // execute the handleSubmit
        component.handleSubmit();

        // assert that the survey response has been saved
        System.assert(component.handleSubmit != null, 'Survey response should have been saved');

        Test.stopTest();
    }
}