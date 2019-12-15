package com.infini.b2e.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "user_secret_question")
public class UserSecretQuestion {
    
    private String agent_id;

    private String corporate_id;
    
    @Id
    private String question_id;

    private String question;
    
    @NotEmpty
    private String answer;

    private Date created_date;

    private Date last_updated_date;
    
    public UserSecretQuestion() {
        
    }

    /**
     * @return the agent_id
     */
    public String getAgent_id() {
        return agent_id;
    }

    /**
     * @param agent_id
     *            the agent_id to set
     */
    public void setAgent_id(String agent_id) {
        this.agent_id = agent_id;
    }

    /**
     * @return the corporate_id
     */
    public String getCorporate_id() {
        return corporate_id;
    }

    /**
     * @param corporate_id
     *            the corporate_id to set
     */

    public void setCorporate_id(String corporate_id) {
        this.corporate_id = corporate_id;
    }

    /**
     * @return the question_id
     */
    public String getQuestion_id() {
        return question_id;
    }

    /**
     * @param question_id
     *            the question_id to set
     */
    public void setQuestion_id(String question_id) {
        this.question_id = question_id;
    }

    /**
     * @return the question
     */
    public String getQuestion() {
        return question;
    }

    /**
     * @param question
     *            the question to set
     */
    public void setQuestion(String question) {
        this.question = question;
    }

    /**
     * @return the answer
     */
    public String getAnswer() {
        return answer;
    }

    /**
     * @param answer
     *            the answer to set
     */
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    /**
     * @return the created_date
     */
    public Date getCreated_date() {
        return created_date;
    }

    /**
     * @param created_date
     *            the created_date to set
     */
    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    /**
     * @return the last_updated_date
     */
    public Date getLast_updated_date() {
        return last_updated_date;
    }

    /**
     * @param last_updated_date
     *            the last_updated_date to set
     */
    public void setLast_updated_date(Date last_updated_date) {
        this.last_updated_date = last_updated_date;
    }

}
