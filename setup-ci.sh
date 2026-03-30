#!/bin/bash

mkdir -p .github/workflows
cat <<EOL > .github/workflows/ci.yml
name: CI Pipeline

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 18

      - name: Install dependencies
        run: npm install

      - name: Build Docker image
        run: docker build -t my-app .
EOL

echo "✅ Workflow file created"

# Step 3: Git add + commit + push
git add .github/workflows/ci.yml
git commit -m "ci: add GitHub Actions workflow"
git push origin main

