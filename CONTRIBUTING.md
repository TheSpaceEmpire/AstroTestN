# Contributing to AstroTestN

Thank you for your interest in contributing to the AstroTestN Token Development Repository! By contributing, you are helping to build the foundation of future blockchain solutions for AstroCrown. This document provides guidelines to ensure effective and seamless collaboration.

---

## Table of Contents
- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Coding Standards](#coding-standards)
- [Commit Message Guidelines](#commit-message-guidelines)
- [Pull Request Process](#pull-request-process)
- [Reporting Issues](#reporting-issues)
- [Community and Support](#community-and-support)

---

## Code of Conduct

By participating in this project, you agree to uphold our [Code of Conduct](CODE_OF_CONDUCT.md). Respectful collaboration is vital to maintaining a positive environment for all contributors.

---

## Getting Started

1. **Fork the Repository**: Create a fork of the repository to work on your local copy.
2. **Clone Your Fork**: Clone your fork to your local machine:
   ```bash
   git clone https://github.com/<your-username>/AstroTestN.git
   ```
3. **Install Dependencies**: If applicable, install the required dependencies.
4. **Set Up Environment**: Review any environment-specific configurations in `.env.example` or relevant setup files.
5. **Create a Branch**: Create a new branch for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```

---

## Coding Standards

### Language
- **Solidity**: Use version specified in `pragma` (e.g., `pragma solidity ^0.8.0;`).
- **JavaScript**: Follow ES6+ standards.

### General Guidelines
- Maintain modularity: Write functions that perform a single responsibility.
- Add comments where necessary for clarity.
- Ensure code readability with proper indentation and naming conventions.

### Linting
- Use the provided linter configuration or ensure your code meets the defined style.

---

## Commit Message Guidelines

### Format
Each commit message should include:

1. **Type**: A short label indicating the purpose of the commit (e.g., `feat`, `fix`, `docs`, `refactor`).
2. **Scope**: Specify the affected module or area (e.g., `smart-contract`, `docs`).
3. **Description**: A short summary of the change.

**Example**:
```plaintext
feat(smart-contract): add anti-crash mechanism
```

### Extended Description
If necessary, include additional details about the change. This can include:
- The problem the change addresses.
- The approach taken.
- Any known limitations or follow-up tasks.

---

## Pull Request Process

1. **Test Your Changes**:
   - Ensure your changes pass all tests and do not introduce new issues.
   - Run test cases with the following command (if applicable):
     ```bash
     npm test
     ```

2. **Submit a Pull Request**:
   - Push your changes to your fork:
     ```bash
     git push origin feature/your-feature-name
     ```
   - Open a pull request from your fork to the main repository.
   - Use a descriptive title and provide details in the pull request description.

3. **Address Feedback**:
   - Collaborate with reviewers and make necessary updates to your pull request.

---

## Reporting Issues

If you encounter a bug, security vulnerability, or have a feature request, please [open an issue](https://github.com/TheSpaceEmpire/AstroTestN/issues).

### Include the Following:
- A clear description of the problem or request.
- Steps to reproduce the issue (if applicable).
- Suggested solutions or additional context.

---

## Community and Support

Join our community to stay updated and connect with other contributors:
- [Discussions](https://github.com/TheSpaceEmpire/AstroTestN/discussions): Share ideas and ask questions.
- [Contact Us](mailto:github-info@spaceempire.space): Reach out for direct support.

We look forward to your contributions! 🚀
