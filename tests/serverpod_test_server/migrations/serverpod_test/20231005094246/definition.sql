BEGIN;

--
-- Class Address as table address
--
CREATE TABLE "address" (
    "id" serial PRIMARY KEY,
    "street" text NOT NULL,
    "inhabitantId" integer
);

--
-- Class Citizen as table citizen
--
CREATE TABLE "citizen" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "companyId" integer NOT NULL,
    "oldCompanyId" integer,
    "_companyEmployeesCompanyId" integer
);

--
-- Class City as table city
--
CREATE TABLE "city" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL
);

--
-- Class Company as table company
--
CREATE TABLE "company" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "townId" integer NOT NULL
);

--
-- Class ObjectFieldScopes as table object_field_scopes
--
CREATE TABLE "object_field_scopes" (
    "id" serial PRIMARY KEY,
    "normal" text NOT NULL,
    "database" text
);

--
-- Class ObjectWithByteData as table object_with_bytedata
--
CREATE TABLE "object_with_bytedata" (
    "id" serial PRIMARY KEY,
    "byteData" bytea NOT NULL
);

--
-- Class ObjectWithDuration as table object_with_duration
--
CREATE TABLE "object_with_duration" (
    "id" serial PRIMARY KEY,
    "duration" bigint NOT NULL
);

--
-- Class ObjectWithEnum as table object_with_enum
--
CREATE TABLE "object_with_enum" (
    "id" serial PRIMARY KEY,
    "testEnum" integer NOT NULL,
    "nullableEnum" integer,
    "enumList" json NOT NULL,
    "nullableEnumList" json NOT NULL,
    "enumListList" json NOT NULL
);

--
-- Class ObjectWithIndex as table object_with_index
--
CREATE TABLE "object_with_index" (
    "id" serial PRIMARY KEY,
    "indexed" integer NOT NULL,
    "indexed2" integer NOT NULL
);

-- Indexes
CREATE INDEX "object_with_index_test_index" ON "object_with_index" USING brin ("indexed", "indexed2");

--
-- Class ObjectWithObject as table object_with_object
--
CREATE TABLE "object_with_object" (
    "id" serial PRIMARY KEY,
    "data" json NOT NULL,
    "nullableData" json,
    "dataList" json NOT NULL,
    "nullableDataList" json,
    "listWithNullableData" json NOT NULL,
    "nullableListWithNullableData" json
);

--
-- Class ObjectWithParent as table object_with_parent
--
CREATE TABLE "object_with_parent" (
    "id" serial PRIMARY KEY,
    "other" integer NOT NULL
);

--
-- Class ObjectWithSelfParent as table object_with_self_parent
--
CREATE TABLE "object_with_self_parent" (
    "id" serial PRIMARY KEY,
    "other" integer
);

--
-- Class ObjectWithUuid as table object_with_uuid
--
CREATE TABLE "object_with_uuid" (
    "id" serial PRIMARY KEY,
    "uuid" uuid NOT NULL,
    "uuidNullable" uuid
);

--
-- Class Organization as table organization
--
CREATE TABLE "organization" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL
);

--
-- Class Person as table person
--
CREATE TABLE "person" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "organizationId" integer,
    "_cityCitizensCityId" integer
);

--
-- Class Post as table post
--
CREATE TABLE "post" (
    "id" serial PRIMARY KEY,
    "content" text NOT NULL,
    "nextId" integer
);

--
-- Class RelatedUniqueData as table related_unique_data
--
CREATE TABLE "related_unique_data" (
    "id" serial PRIMARY KEY,
    "uniqueDataId" integer NOT NULL,
    "number" integer NOT NULL
);

--
-- Class SimpleData as table simple_data
--
CREATE TABLE "simple_data" (
    "id" serial PRIMARY KEY,
    "num" integer NOT NULL
);

--
-- Class SimpleDateTime as table simple_date_time
--
CREATE TABLE "simple_date_time" (
    "id" serial PRIMARY KEY,
    "dateTime" timestamp without time zone NOT NULL
);

--
-- Class Town as table town
--
CREATE TABLE "town" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "mayorId" integer
);

--
-- Class Types as table types
--
CREATE TABLE "types" (
    "id" serial PRIMARY KEY,
    "anInt" integer,
    "aBool" boolean,
    "aDouble" double precision,
    "aDateTime" timestamp without time zone,
    "aString" text,
    "aByteData" bytea,
    "aDuration" bigint,
    "aUuid" uuid,
    "anEnum" integer
);

--
-- Class UniqueData as table unique_data
--
CREATE TABLE "unique_data" (
    "id" serial PRIMARY KEY,
    "number" integer NOT NULL,
    "email" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "email_index_idx" ON "unique_data" USING btree ("email");

--
-- Foreign relations for "address" table
--
ALTER TABLE ONLY "address"
    ADD CONSTRAINT "address_fk_0"
    FOREIGN KEY("inhabitantId")
    REFERENCES "citizen"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "citizen" table
--
ALTER TABLE ONLY "citizen"
    ADD CONSTRAINT "citizen_fk_0"
    FOREIGN KEY("companyId")
    REFERENCES "company"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "citizen"
    ADD CONSTRAINT "citizen_fk_1"
    FOREIGN KEY("oldCompanyId")
    REFERENCES "company"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "citizen"
    ADD CONSTRAINT "citizen_fk_2"
    FOREIGN KEY("_companyEmployeesCompanyId")
    REFERENCES "company"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "company" table
--
ALTER TABLE ONLY "company"
    ADD CONSTRAINT "company_fk_0"
    FOREIGN KEY("townId")
    REFERENCES "town"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "object_with_parent" table
--
ALTER TABLE ONLY "object_with_parent"
    ADD CONSTRAINT "object_with_parent_fk_0"
    FOREIGN KEY("other")
    REFERENCES "object_field_scopes"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "object_with_self_parent" table
--
ALTER TABLE ONLY "object_with_self_parent"
    ADD CONSTRAINT "object_with_self_parent_fk_0"
    FOREIGN KEY("other")
    REFERENCES "object_with_self_parent"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "person" table
--
ALTER TABLE ONLY "person"
    ADD CONSTRAINT "person_fk_0"
    FOREIGN KEY("organizationId")
    REFERENCES "organization"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "person"
    ADD CONSTRAINT "person_fk_1"
    FOREIGN KEY("_cityCitizensCityId")
    REFERENCES "city"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "post" table
--
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_0"
    FOREIGN KEY("nextId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "related_unique_data" table
--
ALTER TABLE ONLY "related_unique_data"
    ADD CONSTRAINT "related_unique_data_fk_0"
    FOREIGN KEY("uniqueDataId")
    REFERENCES "unique_data"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- Foreign relations for "town" table
--
ALTER TABLE ONLY "town"
    ADD CONSTRAINT "town_fk_0"
    FOREIGN KEY("mayorId")
    REFERENCES "citizen"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR serverpod_test
--
INSERT INTO "serverpod_migrations" ("module", "version", "priority", "timestamp")
    VALUES ('serverpod_test', '20231005094246', 2, now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20231005094246', "priority" = 2;


COMMIT;
