pipeline {
    agent any

    parameters {
        choice choices: ['dev', 'prod'], name: 'select_environment'
    }

    stages {
        stage('Clean Results') {
            steps {
                bat '''
                    if exist Results rmdir /s /q Results
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
            post {
                success {
                    dir('Results') {
                        stash name: 'Artifacts', includes: '**/*.*'
                    }
                    echo 'Results stashed successfully.'
                }
                failure {
                    echo 'Tests failed. Nothing stashed.'
                }
            }
        }

        stage('Deploy Dev') {
            when {expression {params.select_environment == 'dev'}
                 beforeAgent true}
            agent {
                label 'Window2'
            }
            steps {
                dir('Results') {
                    unstash 'Artifacts'
                    bat '''
                        echo Listing Results contents:
                        dir
                    '''
                    // If needed, add your logic to deploy or send files from here
                }
            }
        }
        stage('Deploy Prod') {
            when {
                expression { params.select_environment == 'prod' }
                    beforeAgent true}
            agent {
                label 'Window2'
            }
            steps {
                timeout(time:5, unit:'DAYS')
                {
                    input message: "Deployment Approved?"
                }
                dir('Results') {
                    unstash 'Artifacts'
                    bat '''
                        echo Listing Results contents:
                        dir
                    '''
                    // If needed, add your logic to deploy or send files from here
                }
            }
        }
    }
}
