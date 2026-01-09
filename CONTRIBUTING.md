# 🤝 Contributing Guide

Thank you for considering contributing to the Dynatrace Problems Dashboard!

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)

## 📜 Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Maintain professional communication

## 🚀 Getting Started

### Prerequisites

- Node.js 18+ LTS
- npm or yarn
- Git
- Code editor (VS Code recommended)

### Setup Development Environment

1. **Fork the repository**
2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/dynatrace-tres.git
   cd dynatrace-tres
   ```

3. **Install dependencies**
   ```bash
   # Using PowerShell script
   .\install.ps1
   
   # Or manually
   cd backend && npm install
   cd ../frontend && npm install
   ```

4. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

## 💻 Development Workflow

### Running the Application

```bash
# Start both servers
.\start.ps1

# Or manually
cd backend && npm run dev
cd frontend && npm run dev
```

### Making Changes

1. **Backend Changes**
   - Edit files in `backend/src/`
   - Server auto-restarts on save
   - Test endpoints with Postman or curl

2. **Frontend Changes**
   - Edit files in `frontend/src/`
   - Browser auto-refreshes on save
   - Check browser console for errors

### Testing Your Changes

```bash
# Backend tests
cd backend
npm test

# Frontend tests
cd frontend
npm test
```

## 📝 Coding Standards

### TypeScript

- **Use strict mode** - All TypeScript must pass strict checks
- **Type everything** - Avoid `any` types when possible
- **Use interfaces** - Define clear interfaces for data structures
- **Document complex types** - Add JSDoc comments

```typescript
// ✅ Good
interface User {
  username: string;
  email: string;
}

const getUser = (id: string): Promise<User> => {
  // ...
}

// ❌ Bad
const getUser = (id: any): any => {
  // ...
}
```

### React Components

- **Use functional components** with hooks
- **Use TypeScript** for props
- **Keep components small** - Single responsibility
- **Use meaningful names** - Clear and descriptive

```typescript
// ✅ Good
interface ButtonProps {
  onClick: () => void;
  children: React.ReactNode;
  variant?: 'primary' | 'secondary';
}

const Button: React.FC<ButtonProps> = ({ onClick, children, variant = 'primary' }) => {
  return <button onClick={onClick} className={variant}>{children}</button>;
};

// ❌ Bad
const Button = (props: any) => {
  return <button {...props} />;
};
```

### Styling

- **Use Tailwind CSS** - Utility-first approach
- **Follow design system** - Use defined colors and spacing
- **Responsive design** - Mobile-first approach
- **Dark mode** - Ensure compatibility

```tsx
// ✅ Good
<div className="flex items-center gap-4 p-6 rounded-lg bg-primary-800 border border-white/10">
  {/* content */}
</div>

// ❌ Bad
<div style={{ display: 'flex', padding: '24px', background: '#1e293b' }}>
  {/* content */}
</div>
```

### API Design

- **RESTful conventions** - Use proper HTTP methods
- **Consistent naming** - Use camelCase for JSON
- **Error handling** - Return meaningful error messages
- **Validation** - Validate all inputs with Zod

```typescript
// ✅ Good
router.get('/problems/:problemId', authenticate, async (req, res) => {
  try {
    const problem = await problemService.getProblemById(req.params.problemId);
    sendSuccess(res, { problem });
  } catch (error) {
    next(error);
  }
});

// ❌ Bad
router.get('/problems/:id', (req, res) => {
  const problem = db.find(req.params.id);
  res.json(problem);
});
```

## 📦 Commit Guidelines

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### Examples

```bash
feat(dashboard): add new KPI card for GitHub Actions

- Added KPI card component
- Integrated with analytics API
- Updated dashboard layout

Closes #123
```

```bash
fix(auth): resolve token expiration issue

- Fixed JWT token refresh logic
- Added proper error handling
- Updated tests

Fixes #456
```

## 🔄 Pull Request Process

### Before Submitting

1. **Update your branch**
   ```bash
   git fetch origin
   git rebase origin/main
   ```

2. **Run linters**
   ```bash
   cd backend && npm run lint
   cd frontend && npm run lint
   ```

3. **Run tests**
   ```bash
   cd backend && npm test
   cd frontend && npm test
   ```

4. **Build the project**
   ```bash
   cd backend && npm run build
   cd frontend && npm run build
   ```

### Submitting a Pull Request

1. **Push your branch**
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create Pull Request**
   - Go to GitHub repository
   - Click "New Pull Request"
   - Select your branch
   - Fill in the template

3. **PR Template**
   ```markdown
   ## Description
   Brief description of changes
   
   ## Type of Change
   - [ ] Bug fix
   - [ ] New feature
   - [ ] Breaking change
   - [ ] Documentation update
   
   ## Testing
   - [ ] Unit tests pass
   - [ ] Integration tests pass
   - [ ] Manual testing completed
   
   ## Screenshots (if applicable)
   
   ## Checklist
   - [ ] Code follows style guidelines
   - [ ] Self-review completed
   - [ ] Comments added for complex code
   - [ ] Documentation updated
   - [ ] No new warnings generated
   ```

### Review Process

1. **Automated checks** - CI/CD pipeline runs
2. **Code review** - Maintainers review code
3. **Feedback** - Address review comments
4. **Approval** - Get approval from maintainers
5. **Merge** - Maintainer merges PR

## 🎨 Design Guidelines

### UI/UX Principles

- **Consistency** - Follow existing patterns
- **Accessibility** - WCAG 2.1 AA compliance
- **Performance** - Optimize for speed
- **Responsiveness** - Mobile-first design

### Color Usage

```typescript
// Severity colors
AVAILABILITY: '#ef4444'  // Critical
ERROR: '#f59e0b'         // Error
PERFORMANCE: '#eab308'   // Warning
RESOURCE_CONTENTION: '#3b82f6'  // Info
CUSTOM_ALERT: '#8b5cf6'  // Custom
```

### Component Structure

```
Component/
├── Component.tsx        # Main component
├── Component.test.tsx   # Tests
├── Component.types.ts   # Type definitions
└── index.ts            # Exports
```

## 🐛 Reporting Bugs

### Bug Report Template

```markdown
**Describe the bug**
Clear description of the bug

**To Reproduce**
Steps to reproduce:
1. Go to '...'
2. Click on '...'
3. See error

**Expected behavior**
What should happen

**Screenshots**
If applicable

**Environment:**
- OS: [e.g., Windows 11]
- Browser: [e.g., Chrome 120]
- Node version: [e.g., 18.17.0]

**Additional context**
Any other relevant information
```

## 💡 Feature Requests

### Feature Request Template

```markdown
**Is your feature request related to a problem?**
Clear description of the problem

**Describe the solution you'd like**
What you want to happen

**Describe alternatives you've considered**
Other solutions you've thought about

**Additional context**
Any other relevant information
```

## 📚 Resources

- [React Documentation](https://react.dev)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Express.js Guide](https://expressjs.com)
- [Tailwind CSS Docs](https://tailwindcss.com)
- [Apache ECharts](https://echarts.apache.org)
- [MongoDB Manual](https://docs.mongodb.com)

## 🙏 Thank You!

Your contributions make this project better for everyone. Thank you for taking the time to contribute!

---

**Questions?** Open an issue or reach out to the maintainers.
