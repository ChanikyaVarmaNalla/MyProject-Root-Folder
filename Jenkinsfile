pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout the Git repository
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'git@github.com:ChanikyaVarmaNalla/MyProject-Root-Folder.git']]])
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    def moduleDirs = [
                        "Module 1": 'TestCase_For_Registration.robot',
                        "Module 2": 'TestCase_For_Login.robot',
                        "Module 3": 'TestCase_For_HR-OS.robot',
                        "Module 4": 'TestCase_For_HR-OS.robot'
                    ]

                    def testResults = [:]

                    // Run tests in parallel
                    parallel moduleDirs.collectEntries { module, testScript ->
                        ["$module": {
                            try {
                                dir("C:\\Users\\ChanikyaN-3227\\PycharmProjects\\MyProject Root Folder\\Framework\\TestCycles\\$module") {
                                    bat "robot -d ../reports $testScript"
                                }
                                testResults["$module"] = 'PASSED'
                            } catch (Exception e) {
                                currentBuild.result = 'FAILURE'
                                testResults["$module"] = 'FAILED'
                            }
                        }]
                    }

                    // Print test results
                    echo "Test Results:"
                    testResults.each { module, result ->
                        echo "$module: $result"
                    }
                }
            }
        }
    }
    post {
        failure {
            echo "Pipeline failed. Please check the test results."
        }
        success {
            echo "Pipeline succeeded. All tests passed."
            archiveArtifacts artifacts: '**/output.xml', allowEmptyArchive: true
        }
    }
}
