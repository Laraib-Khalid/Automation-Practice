pipeline {
    agent any

    stages {
        stage('Clean Results') {
            steps {
                bat '''
                    if exist Results rmdir /s /q Results
                    mkdir Results
                '''
            }
        }
        stage('Set up Python Env') {
            steps {
                bat '''
                    python -m venv venv
                    call venv\\Scripts\\activate.bat
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat '''
                    call venv\\Scripts\\activate.bat
                    pabot --processes 2 --outputdir Results Automation\\*.robot
                '''
            }
        }
    }
}
