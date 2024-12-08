# GitHub Actions

## .github/workflows/github-actions.yml

```yml
name: CI for React Native App with Jest and Expo

on:
  push:
    branches:
      - '**'
  pull_request:
    branches:
      - '**'

jobs:
  react-native-test-suite:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Cache Node.js modules
        uses: actions/cache@v3
        with:
          path: ~/.npm
          key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
          restore-keys: |
            ${{ runner.os }}-node-

      - name: Install dependencies
        run: npm install
        working-directory: OneStopShop

      - name: Run tests with coverage
        run: npm run test -- --coverage
        working-directory: OneStopShop

      - name: Upload coverage to Codecov
        uses: codecov/codecov-action@v3
        with:
          token: ${{ secrets.CODECOV_TOKEN }}
```
