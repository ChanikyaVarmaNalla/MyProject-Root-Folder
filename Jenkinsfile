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
                // First, navigate to the directory for module 1 tests
                dir("C:\\Users\\ChanikyaN-3227\\PycharmProjects\\MyProject Root Folder\\Framework\\TestCycles\\Module 1") {
                    // Run Robot Framework tests for reg module 1
                    bat 'robot TestCase_For_Registration.robot'
                }
                // Then, navigate to the directory for module 1 tests
                dir("C:\\Users\\ChanikyaN-3227\\PycharmProjects\\MyProject Root Folder\\Framework\\TestCycles\\Module 2") {
                    // Run Robot Framework tests for login module 1
                    bat 'robot TestCase_For_Login.robot'
                }
                // Navigate to the directory for module 2 tests
                dir("C:\\Users\\ChanikyaN-3227\\PycharmProjects\\MyProject Root Folder\\Framework\\TestCycles\\Module 3") {
                    // Run Robot Framework tests for reg module 2
                    bat 'robot TestCase_For_HR-OS.robot'
                }
                // Then, navigate to the directory for module 2 tests
                dir("C:\\Users\\ChanikyaN-3227\\PycharmProjects\\MyProject Root Folder\\Framework\\TestCycles\\Module 4") {
                    // Run Robot Framework tests for login module 2
                    bat 'robot TestCase_For_HR-OS.robot'
                }
            }
        }
    }
}
