# Vector Databases

**Keywords:** Semantic Search, Embedding

## Links

- [Astra DB (Vector)](https://datastax.com/products/datastax-astra)
- [Chroma](/chroma.md)
- [Milvus](/milvus.md)
- [PGVector](/pgvector.md)
- [Pinecone](/pinecone.md)
- [Qdrant](/qdrant/README.md) 🌟
- [Upstash](/upstash/README.md)
- [Weaviate](/weaviate.md)

<!--
https://github.com/weaviate/weaviate
https://github.com/milvus-io/milvus
https://github.com/tantaraio/voy

Structure

https://github.com/naman7474/search_app/blob/main/app/lib/vector-db/interfaces.ts
https://github.com/negimox/nagrik_app/blob/main/lib/vector-db.ts
https://github.com/karlgots/azure-openai-rag-workshop/tree/main/src/indexer/src/lib/vector-db
-->

<!--
Pinecone

https://github.com/Jefreesujit/yt-chat/blob/main/src/lib/vectordb.ts
https://github.com/vishalmaurya850/Claro-Chatbot/blob/master/lib/vector-db.ts
https://github.com/jaymalave/raycaster-qna/blob/main/src/lib/vectorDb/pinecone.ts
https://github.com/Gleb-afk/nextjs-ai-assistant/blob/main/lib/vector-db.ts
https://github.com/SuyashSingh01/Candidate-Form/blob/main/lib/vector-db.ts
https://github.com/IshanRaj03/CareerHive/blob/main/lib/vectorDb/index.ts
https://github.com/intervenehq/parser-demo/blob/main/src/lib/vector-stores/pinecone.ts
https://github.com/rishy-2021/pdf-insight-extracter
https://github.com/quangcito/dailybalance/blob/main/src/lib/vector-db/pinecone.ts

Chroma

https://github.com/mathiasb/garbo/blob/main/src/lib/vectordb.ts
https://github.com/intervenehq/parser-demo/blob/main/src/lib/vector-stores/chromadb.ts
https://github.com/Klimatbyran/garbo/blob/main/src/lib/vectordb.ts

OpenAI

https://github.com/adhameldeeb/AIDataGem.com/blob/main/src/lib/vectorDb.ts
https://github.com/oaknational/oak-ai-lesson-assistant/blob/main/packages/rag/lib/embedding.ts
https://github.com/Intelligent-Internet/ii-agent-community/blob/main/ai-flower-shop/src/lib/vector-db.ts

In-memory

https://github.com/GREOGREEN/neuroverseai/blob/main/server/lib/vector-db.ts

Astra DB

https://github.com/Khalil-am/khalil-am-portfolio/blob/main/src/lib/vectordb.ts
https://github.com/mikias-wondim/rag-chatbot/blob/main/lib/vector-db.ts
https://github.com/NavPilDev/nav-portfolio/blob/main/src/lib/vectordb.ts
https://github.com/Rahul-lalwani-learner/rahullalwani.com/blob/main/lib/vectordb.ts

pgvector

https://github.com/parikkap/PG-vector-poc/blob/main/src/app/api/upload/route.ts
https://github.com/axflow/original-demo-ui/blob/main/app/api/ingest/upload/route.ts
https://github.com/ShahinAlomShuvo/QueryNest/blob/main/app/api/upload/route.ts
https://github.com/kagaba-etienne/potential-sniffle/blob/develop/src/app/api/embed/route.tsx
https://github.com/aniketchauhan18/hiraya/blob/main/src/app/api/v1/embeddings/route.ts
https://github.com/parikkap/PG-vector-poc/blob/main/src/app/api/upload/route.ts
https://github.com/Ilanklim/ilan-klimberg-resume-site/blob/main/src/lib/vectordb/pgvector.ts
https://github.com/makeorbreakshop/video-scripter/blob/main/lib/vector-db-service.ts

Neon

https://github.com/neondatabase/db-per-tenant/tree/main/app/lib/vector-db

Qdrant

https://github.com/CoderGhost37/Notebook-LLM-RAG/blob/main/src/app/api/embeddings/upload/route.tsx
https://github.com/nosyn/mai/blob/main/frontend/src/lib/vector-db/qdrant.ts
https://github.com/karlgots/azure-openai-rag-workshop/blob/main/src/indexer/src/lib/vector-db/qdrant.ts
https://github.com/iKunal-Singh/v0-qdrant-and-open-ai-integration/blob/main/lib/vector-db.ts

Upstash

https://github.com/techysiddhant/10xcoder-backend/blob/main/src/lib/vectordb.ts
https://github.com/louis-adriano/about-to-eat-rag-mcp/blob/main/lib/vector-db.ts
https://github.com/Keisuke-Hiraki/yuni-youtube-analytics/blob/main/lib/vector-db.ts

Azure Cosmos DB

https://github.com/turning-point-org/tpa-web-app/blob/main/src/lib/vectordb.ts

LangChain + Pinecone

https://github.com/samarthpandeydev/voicebook/blob/main/app/api/upload/route.ts
https://github.com/aramasethu/rebuff/blob/main/javascript-sdk/src/lib/vectordb.ts

LangChain + pgvector

https://github.com/ShahinAlomShuvo/QueryNest/blob/main/app/api/file-chat/route.ts
https://github.com/tangguhriyadi/chatbot-rag/blob/master/src/app/api/collection/route.ts

LangChain

https://github.com/prashantbhudwal/dabbleWithLangchain/blob/master/app/api/lib/vectordb.ts
https://github.com/felipetruman/rebuff/blob/main/javascript-sdk/src/lib/vectordb.ts
https://github.com/sdcharly/quiz-app/blob/main/src/lib/vectorDb.ts

Weaviate

https://github.com/saptiva-ai/ragster/blob/main/src/app/api/upload-weaviate/route.ts
https://github.com/workforce-oss/workforce/blob/main/workforce-core/src/objects/document_repository/impl/lib/vectordb/weaviate_classes.ts
https://github.com/sshamim-3cps/jcb-node/blob/development/jcbreact-be/src/lib/vectordb.ts

Milvus

https://github.com/Tekmindlabs/lxp-aide/blob/main/src/lib/vectorDb/milvus/index.ts

REST - Qdrant, Weaviate, or ChromaDB

https://github.com/zikazama/caker-simple/blob/main/src/lib/vector-db.ts
-->

<!--
Rerank

https://github.com/oaknational/oak-ai-lesson-assistant/blob/main/packages/rag/lib/rerank.ts
-->
