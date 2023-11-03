import { GenericContainer, Wait } from "testcontainers";

import pkg from 'pg';
const { Client } = pkg;

const t1 = new Date().getTime();

const container = await new GenericContainer("docker-postgres-theater")
    .withExposedPorts(5432)
    .withWaitStrategy(Wait.forLogMessage("database system is ready to accept connections"))
    .start();

const client = new Client({
    host: "localhost",
    port: container.getFirstMappedPort(),
    database: "postgres",
    user: "postgres",
    password: "postgres",
});

console.log(container.getFirstMappedPort())

await client.connect();

const result = await client.query("SELECT * FROM representation");
console.log(result);

await client.end();
await container.stop();


const t2 = new Date().getTime();

console.log(`Time taken: ${t2 - t1}ms`);
