CREATE MIGRATION m1n3as2qffbmbit2a4eifc2l7wjzve5pdlgi7jyjnxx2bc63ozhjzq
    ONTO initial
{
  CREATE TYPE default::BlogPost {
      CREATE REQUIRED PROPERTY slug: std::str;
      CREATE CONSTRAINT std::exclusive ON (.slug);
      CREATE INDEX ON (.slug);
      CREATE REQUIRED PROPERTY content: std::str;
      CREATE PROPERTY created: std::datetime;
      CREATE PROPERTY description: std::str;
      CREATE PROPERTY published: std::datetime;
      CREATE PROPERTY status: std::str {
          SET default := 'draft';
      };
      CREATE REQUIRED PROPERTY title: std::str;
      CREATE PROPERTY updated: std::datetime;
  };
  CREATE TYPE default::Tag {
      CREATE MULTI LINK posts: default::BlogPost;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  ALTER TYPE default::BlogPost {
      CREATE MULTI LINK tags: default::Tag;
  };
};
