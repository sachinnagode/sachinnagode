# Security Guidelines

## Firebase Configuration

### For Development
1. Copy `.env.example` to `.env`
2. Fill in your Firebase credentials
3. Never commit `.env` to version control

### For Production
1. Use environment variables or secret management
2. Restrict Firebase API access
3. Enable security rules in Firestore
4. Use service accounts with minimal permissions

### Firebase Security Rules Example
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /messages/{messageId} {
      allow read, write: if request.time < timestamp.date(2024, 1, 1);
    }
  }
}
```

### Recommended Tools
- **flutter_dotenv** - Environment variables
- **flutter_config** - Build-time configuration
- **GitHub Secrets** - CI/CD secrets management
