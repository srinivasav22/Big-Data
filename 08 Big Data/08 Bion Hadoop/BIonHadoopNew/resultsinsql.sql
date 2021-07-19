
DROP DATABASE IF EXISTS insofe_results;
CREATE DATABASE IF NOT EXISTS insofe_results;
USE insofe_results;
CREATE TABLE IF NOT EXISTS active_emp_details (
        emp_no                  INT(11)        NOT NULL,
        first_name              VARCHAR(14)    NOT NULL,
        last_name               VARCHAR(16)    NOT NULL,
        gender                  CHAR(1)        NOT NULL,
        birth_date              DATE           NOT NULL,
        hire_date               DATE           NOT NULL,
        dept_no                 CHAR(4)        NOT NULL,
        dept_name               VARCHAR(40)    NOT NULL,
        dept_from_date          DATE           NOT NULL,
        salary                  INT            NOT NULL,
        salary_from_date        DATE           NOT NULL,
        title                   VARCHAR(50)    NOT NULL,
        title_from_date         DATE           NOT NULL,
        manager_emp_no          INT(11)        NOT NULL,
        manager_first_name      VARCHAR(14)    NOT NULL,
        manager_last_name       VARCHAR(16)    NOT NULL,
        manager_gender          CHAR(1)        NOT NULL,
        manager_birth_date      DATE           NOT NULL,
        manager_hire_date       DATE           NOT NULL,
        manager_from_date       DATE           NOT NULL,
        age                     TINYINT        NOT NULL,
        tenure                  TINYINT        NOT NULL,
        manager_age             TINYINT        NOT NULL,
        manager_tenure          TINYINT        NOT NULL,
        salary_since            TINYINT        NOT NULL,
        role_since              TINYINT        NOT NULL,
        KEY (emp_no),
        PRIMARY KEY (emp_no));
        
        
CREATE TABLE IF NOT EXISTS dept_aggr_by_gender (
        dept_no                 CHAR(4)         NOT NULL,
        dept_name               VARCHAR(40)     NOT NULL,
        gender                  CHAR(1)         NOT NULL,
        tot_emp                 BIGINT          NOT NULL,
        tot_sal                 BIGINT          NOT NULL,
        min_sal                 BIGINT          NOT NULL,
        max_sal                 BIGINT          NOT NULL,
        avg_sal                 DECIMAL(20,2)   NOT NULL,
        min_age                 TINYINT         NOT NULL,
        max_age                 TINYINT         NOT NULL,
        avg_age                 DECIMAL(5,2)    NOT NULL,
        min_tenure              TINYINT         NOT NULL,
        max_tenure              TINYINT         NOT NULL,
        avg_tenure              DECIMAL(5,2)    NOT NULL,
        avg_sal_change          DECIMAL(5,2)    NOT NULL,
        avg_role_change         DECIMAL(5,2)    NOT NULL,
        KEY (dept_no),
        KEY (gender),
        PRIMARY KEY (dept_no, gender));
        
CREATE TABLE IF NOT EXISTS dept_aggr (
        dept_no                 CHAR(4)         NOT NULL,
        dept_name               VARCHAR(40)     NOT NULL,
        tot_emp                 BIGINT          NOT NULL,
        tot_sal                 BIGINT          NOT NULL,
        min_sal                 BIGINT          NOT NULL,
        max_sal                 BIGINT          NOT NULL,
        avg_sal                 DECIMAL(20,2)   NOT NULL,
        min_age                 TINYINT         NOT NULL,
        max_age                 TINYINT         NOT NULL,
        avg_age                 DECIMAL(5,2)    NOT NULL,
        min_tenure              TINYINT         NOT NULL,
        max_tenure              TINYINT         NOT NULL,
        avg_tenure              DECIMAL(5,2)    NOT NULL,
        avg_sal_change          DECIMAL(5,2)    NOT NULL,
        avg_role_change         DECIMAL(5,2)    NOT NULL,
        PRIMARY KEY (dept_no));

show tables;
