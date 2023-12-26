## Medusa.js Admin and Backend Installation

**It is possible to install only this repository, but for a better experience it is recommended that you install the entire medusa project from this repository 🡢** https://gitlab.com/erpsistemas/medusa-project

**Requirements**

* Node.js v20 or higher
* PostgreSQL

**Steps**

1. **Create a PostgreSQL database:**
    * Create a database named `medusa-db` on your local PostgreSQL server. 

2. **Clone the repository:**
    * Clone this repository to your local machine.
    * Enter the directory containing the cloned repository.

3. **Configure environment variables:**
    * Create a file named `.env` in the project root directory.
    * Add the following variables to the `.env` file, replacing the placeholder values with your own:

```
DATABASE_URL=postgres://postgres_user:postgres_pass@localhost:postgres_port/medusa-db
JWT_SECRET=something
COOKIE_SECRET=something
```

**Note:** Remember to replace `postgres_user`, `postgres_pass`, and `postgres_port` with your actual PostgreSQL credentials and port number. And the JWT_SECRET and COOKIE_SECRET variables, leave them as they are.

4. **Install dependencies:**
    * Run the following command to install all necessary dependencies:

```
npm install && npm install @medusajs/medusa-cli -g
```

5. **Desconfigure Redis:**
    * Redis is not necessary at this time so go into the `medusa-config.js` file and comment out the following lines of code seen below, only comment out the ones seen commented here:

```
eventBus: {
//   resolve: "@medusajs/event-bus-redis",
//   options: {
//     redisUrl: REDIS_URL
//   }
// },
// cacheService: {
//   resolve: "@medusajs/cache-redis",
//   options: {
//     redisUrl: REDIS_URL
//   }
},
```

6. **Comment out line 88 in `medusa-config.js`:**
    * Open the `medusa-config.js` file and comment out line 88, which should look like this:

```
const projectConfig = {
  jwtSecret: process.env.JWT_SECRET,
  cookieSecret: process.env.COOKIE_SECRET,
  store_cors: STORE_CORS,
  database_url: DATABASE_URL,
  admin_cors: ADMIN_CORS,
  // redis_url: REDIS_URL  // Comment out this line
};
```

7. **Desconfigure Meilisearch:**
    * Meilisearch is not necessary at this time so go into the `medusa-config.js` file and comment out the following lines of code seen below, only comment out the ones seen commented here, from line 52 to 78 in the `medusa-config.js` file:

```
// resolve: `medusa-plugin-meilisearch`,
// options: {
//   config: {
//     host: process.env.MEILISEARCH_HOST,
//     apiKey: process.env.MEILISEARCH_API_KEY,
//   },
//   settings: {
//     products: {
//       indexSettings: {
//         searchableAttributes: [
//           "title", 
//           "description",
//           "variant_sku",
//         ],
//         displayedAttributes: [
//           "id", 
//           "title", 
//           "description", 
//           "variant_sku", 
//           "thumbnail", 
//           "handle",
//         ],
//       },
//       primaryKey: "id",
//     },
//   },
// },
```

**Note:** You will need to set the `REDIS_URL` environment variable in your `.env` file to the URL of your Redis server if you decide to use redis.

8. **Seed the database:**
    * Run the following command to seed example data into the database:

```
npm run seed
```

**Note:** This command should only be run once.

9. **Start the application:**
    * Run the following command to start the Medusa backend and admin:

```
npm run dev
```

**Test**

You can test that the backend is running correctly by running the following command:

```
curl http://localhost:9000/store/products
```

If it returns an product object, everything is working as expected.

**Admin Access:**

* You can access the Medusa admin panel at http://localhost:7001/.
* The default login credentials are:
    * Username: `admin@medusa-test.com`
    * Password: `supersecret`

**Extras:**

* **Create a new user:**

```
npx medusa user -e some@email.com -p some-password
```

* **Medusa Documentation:**

[https://docs.medusajs.com/](https://docs.medusajs.com/)

This documentation provides detailed information about using Medusa, including tutorials, API references, and configuration options.

