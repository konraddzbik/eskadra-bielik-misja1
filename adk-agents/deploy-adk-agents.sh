#!/bin/bash                                

source reload-env.sh                       

# Deploy to Cloud Run
gcloud run deploy adk-agents \             # nazwa Twojej usługi w Cloud Run
    --source . \                           # weź kod z bieżącego katalogu i zbuduj kontener
    --region "$GOOGLE_CLOUD_LOCATION" \    # region GCP (np. europe-central2)
    --allow-unauthenticated \              # każdy w internecie może korzystać (publiczne API)
    --set-env-vars GOOGLE_CLOUD_LOCATION="$GOOGLE_CLOUD_LOCATION" \  # przekaż region do aplikacji
    --set-env-vars OLLAMA_API_BASE="$OLLAMA_API_BASE" \              # adres serwera z modelem Bielik
    --set-env-vars GOOGLE_API_KEY="$GOOGLE_API_KEY" \                # klucz do modeli Google
    --labels dev-tutorial=codelab-dos-"$BIELIK_EVENT_ID"             # tagowanie dla warsztatu Bielika