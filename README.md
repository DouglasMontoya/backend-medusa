## Medusa.js Admin and Backend Installation

**Requirements**

* Have the containers installed as specified in 🡢 <a href="https://gitlab.com/erpsistemas/medusa-project" target="_blank">Medusa.js Project Installation</a>
* Node.js v20 or higher

**Steps**

1. **Clone the repository:**
    * Clone this repository to your local machine.
    * Enter the directory containing the cloned repository.

2. **Configure environment variables:**
    * Create a file named `.env` in the project root directory and add the following variables.

```
JWT_SECRET=something
COOKIE_SECRET=something
MEILISEARCH_HOST=http://localhost:7700
MEILISEARCH_API_KEY=ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad
MINIO_ENDPOINT=http://localhost:9001
MINIO_BUCKET=medusa-bucket
MINIO_ACCESS_KEY=<ACCESS_KEY>
MINIO_SECRET_KEY=<SECRET_KEY>
```

* Change `<ACCESS_KEY>` and `<SECRET_KEY>` for the credentials you created in minio

3. **Install dependencies:**
    * Run the following command to install all necessary dependencies:

```
npm install && npm install @medusajs/medusa-cli -g
```

4. **Seed the database:**
    * Run the following command to seed example data into the database:

```
npm run seed
```

**Note:** This command should only be run once.

5. **Start the application:**
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

Where `some@email.com` is the email address you want and `some-password` is the password you want.

* **If you want to run queries directly against the database, run these commands:**

```
docker exec -it postgres bash
su - postgres
psql medusa-db
```

This will take you inside the Medusa.js database and allow you to run queries directly against the database using SQL syntax.

* **Medusa Documentation:**

[https://docs.medusajs.com/](https://docs.medusajs.com/)

This documentation provides detailed information about using Medusa, including tutorials, API references, and configuration options.

