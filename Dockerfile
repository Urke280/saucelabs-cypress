# Use Cypress base image
FROM cypress/included:13.6.4

# Set working dir
WORKDIR /app

# Copy package.json and install deps
COPY package*.json ./
RUN npm install

# Copy tests
COPY . .

# Run Cypress tests
CMD ["npx", "cypress", "run", "--reporter", "cypress-mochawesome-reporter"]
