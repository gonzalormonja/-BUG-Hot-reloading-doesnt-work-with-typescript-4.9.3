###################
# BUILD FOR LOCAL DEVELOPMENT
###################

FROM node:18-alpine As development

# Create app directory
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure copying both package.json AND package-lock.json (when available).
# Copying this first prevents re-running npm install on every code change.
COPY  package*.json ./

# Install app dependencies using the `npm ci` command instead of `npm install`
RUN npm i

# Bundle app source
COPY  . .

# Use the node user from the image (instead of the root user)
USER node
