import { LightningElement, api, track } from 'lwc';
import getQuestions from '@salesforce/apex/SurveyQuestionsController.getQuestions';
import getQuestionChoices from '@salesforce/apex/SurveyQuestionsController.getQuestionChoices';
import saveSurveyResponse from '@salesforce/apex/SurveyQuestionsController.saveSurveyResponse';

export default class SurveyFeedbackLWC extends LightningElement {
    @api surveyId;
    @track questions;
    @track questionChoices;
    @track surveyResponse = [];

    connectedCallback() {
        getQuestions({surveyId: this.surveyId})
            .then(result => {
                this.questions = result;
            })
            .catch(error => {
                // handle error
            });
    }

    handleQuestionTypeChange(event) {
        let questionId = event.target.name;
        let questionType = event.target.value;

        getQuestionChoices({surveyId: this.surveyId, questionId: questionId, questionType: questionType})
            .then(result => {
                this.questionChoices = result;
            })
            .catch(error => {
                // handle error
            });
    }

    handleAnswerChange(event) {
        let questionId = event.target.name;
        let answerId = event.target.value;

        this.surveyResponse = this.surveyResponse.map(response => {
            if (response.questionId === questionId) {
                response.answerId = answerId;
            }
            return response;
        });
    }

    handleSubmit() {
        saveSurveyResponse({surveyResponse: this.surveyResponse})
            .then(result => {
                // handle success
            })
            .catch(error => {
                // handle error
            });
    }
}