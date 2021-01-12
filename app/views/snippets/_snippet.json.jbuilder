json.name snippet.name
json.expires_at snippet.expires_at
json.snippet snippet.snippet
json.likes snippet.likes if snippet.likes > 0
json.url snippet_url(snippet, format: :json)
