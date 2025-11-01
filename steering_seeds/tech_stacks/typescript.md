# TypeScript Development Standards

## TypeScript Version
- Use **TypeScript 5.0+** for new projects
- Enable strict mode for maximum type safety
- Keep TypeScript updated regularly

## Project Configuration

### tsconfig.json
Essential compiler options:

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "lib": ["ES2022", "DOM"],
    "moduleResolution": "bundler",
    
    // Strict Type Checking
    "strict": true,
    "strictNullChecks": true,
    "noImplicitAny": true,
    "noImplicitThis": true,
    
    // Additional Checks
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "noUncheckedIndexedAccess": true,
    
    // Module Resolution
    "esModuleInterop": true,
    "skipLibCheck": true,
    "resolveJsonModule": true,
    
    // Output
    "outDir": "./dist",
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
```

## Type Safety

### Avoid `any`
Use specific types or `unknown`:

```typescript
// ❌ Bad: Loses type safety
function process(data: any) {
  return data.value;
}

// ✅ Good: Use unknown with type guards
function process(data: unknown) {
  if (typeof data === 'object' && data !== null && 'value' in data) {
    return (data as { value: string }).value;
  }
  throw new Error('Invalid data');
}

// ✅ Better: Use specific types
interface Data {
  value: string;
}

function process(data: Data) {
  return data.value;
}
```

### Use Type Inference
Let TypeScript infer types when obvious:

```typescript
// ✅ Good: Type inference
const numbers = [1, 2, 3]; // number[]
const user = { name: 'John', age: 30 }; // { name: string; age: number }

// ❌ Bad: Redundant type annotation
const numbers: number[] = [1, 2, 3];
const user: { name: string; age: number } = { name: 'John', age: 30 };
```

### Strict Null Checks
Handle null and undefined explicitly:

```typescript
// ✅ Good: Explicit null handling
function getUser(id: string): User | null {
  const user = database.find(id);
  return user ?? null;
}

const user = getUser('123');
if (user) {
  console.log(user.name); // Safe
}

// ✅ Good: Optional chaining
console.log(user?.name);

// ✅ Good: Nullish coalescing
const name = user?.name ?? 'Unknown';
```

## Advanced Type Features

### Union and Intersection Types
```typescript
// Union: value can be one of several types
type Status = 'pending' | 'approved' | 'rejected';

function setStatus(status: Status) {
  // TypeScript ensures only valid values
}

// Intersection: combine multiple types
type User = { name: string };
type Admin = { permissions: string[] };
type AdminUser = User & Admin;

const admin: AdminUser = {
  name: 'John',
  permissions: ['read', 'write']
};
```

### Type Guards
```typescript
// Type predicate
function isString(value: unknown): value is string {
  return typeof value === 'string';
}

function process(value: unknown) {
  if (isString(value)) {
    console.log(value.toUpperCase()); // TypeScript knows it's string
  }
}

// Discriminated unions
type Success = { status: 'success'; data: string };
type Error = { status: 'error'; message: string };
type Result = Success | Error;

function handle(result: Result) {
  if (result.status === 'success') {
    console.log(result.data); // TypeScript knows it's Success
  } else {
    console.log(result.message); // TypeScript knows it's Error
  }
}
```

### Generics
```typescript
// Generic function
function identity<T>(value: T): T {
  return value;
}

const num = identity(42); // number
const str = identity('hello'); // string

// Generic interface
interface Repository<T> {
  find(id: string): Promise<T | null>;
  save(item: T): Promise<void>;
}

class UserRepository implements Repository<User> {
  async find(id: string): Promise<User | null> {
    // Implementation
  }
  
  async save(user: User): Promise<void> {
    // Implementation
  }
}

// Constrained generics
function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

const user = { name: 'John', age: 30 };
const name = getProperty(user, 'name'); // string
```

### Utility Types
```typescript
interface User {
  id: string;
  name: string;
  email: string;
  age: number;
}

// Partial: all properties optional
type PartialUser = Partial<User>;

// Pick: select specific properties
type UserPreview = Pick<User, 'id' | 'name'>;

// Omit: exclude specific properties
type UserWithoutId = Omit<User, 'id'>;

// Readonly: make all properties readonly
type ReadonlyUser = Readonly<User>;

// Record: create object type with specific keys
type UserMap = Record<string, User>;
```

## Code Organization

### Project Structure
```
project/
├── src/
│   ├── types/
│   │   └── index.ts        # Shared types
│   ├── models/
│   │   └── user.ts         # Domain models
│   ├── services/
│   │   └── userService.ts  # Business logic
│   ├── api/
│   │   └── routes.ts       # API endpoints
│   └── index.ts            # Entry point
├── tests/
│   └── user.test.ts
├── tsconfig.json
└── package.json
```

### Module Organization
```typescript
// types/user.ts
export interface User {
  id: string;
  name: string;
  email: string;
}

export type UserId = string;

// services/userService.ts
import { User, UserId } from '../types/user';

export class UserService {
  async getUser(id: UserId): Promise<User | null> {
    // Implementation
  }
}
```

## Testing

### Type-Safe Tests
```typescript
import { describe, it, expect } from 'vitest';
import { UserService } from './userService';

describe('UserService', () => {
  it('should return user by id', async () => {
    const service = new UserService();
    const user = await service.getUser('123');
    
    expect(user).toBeDefined();
    expect(user?.name).toBe('John');
  });
});
```

### Mock Types
```typescript
// Create mock with correct types
const mockUser: User = {
  id: '123',
  name: 'John',
  email: 'john@example.com'
};

// Type-safe mock function
const mockGetUser = vi.fn<[string], Promise<User | null>>();
mockGetUser.mockResolvedValue(mockUser);
```

## Tooling

### Package Manager
Use modern package managers:
- **pnpm** (recommended) - Fast, efficient
- **npm** - Standard
- **yarn** - Alternative

### Build Tools
**Vite** (recommended for web apps):
```bash
npm create vite@latest my-app -- --template vanilla-ts
```

**tsc** (for libraries):
```bash
tsc --build
```

### Linting and Formatting
**ESLint with TypeScript**:
```json
{
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:@typescript-eslint/recommended-requiring-type-checking"
  ],
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "project": "./tsconfig.json"
  }
}
```

**Prettier**:
```json
{
  "semi": true,
  "singleQuote": true,
  "trailingComma": "es5",
  "printWidth": 100
}
```

## Framework Integration

### React + TypeScript
```typescript
import { FC, useState } from 'react';

interface ButtonProps {
  label: string;
  onClick: () => void;
  disabled?: boolean;
}

export const Button: FC<ButtonProps> = ({ label, onClick, disabled = false }) => {
  return (
    <button onClick={onClick} disabled={disabled}>
      {label}
    </button>
  );
};

// Hooks with types
function useCounter(initial: number = 0) {
  const [count, setCount] = useState(initial);
  
  const increment = () => setCount(c => c + 1);
  const decrement = () => setCount(c => c - 1);
  
  return { count, increment, decrement };
}
```

### Node.js + TypeScript
```typescript
import express, { Request, Response } from 'express';

const app = express();

interface CreateUserRequest {
  name: string;
  email: string;
}

app.post('/users', async (req: Request<{}, {}, CreateUserRequest>, res: Response) => {
  const { name, email } = req.body;
  
  // Type-safe request handling
  const user = await createUser({ name, email });
  
  res.json(user);
});
```

## Best Practices

### Naming Conventions
- **Interfaces/Types**: PascalCase (`User`, `UserRepository`)
- **Variables/Functions**: camelCase (`getUserById`, `userName`)
- **Constants**: UPPER_SNAKE_CASE (`MAX_RETRY_COUNT`)
- **Type parameters**: Single uppercase letter or PascalCase (`T`, `TUser`)

### Interface vs Type
```typescript
// Use interface for object shapes (can be extended)
interface User {
  id: string;
  name: string;
}

interface Admin extends User {
  permissions: string[];
}

// Use type for unions, intersections, and complex types
type Status = 'active' | 'inactive';
type Result<T> = { success: true; data: T } | { success: false; error: string };
```

### Avoid Type Assertions
```typescript
// ❌ Bad: Type assertion bypasses type checking
const user = data as User;

// ✅ Good: Validate and narrow type
function isUser(data: unknown): data is User {
  return (
    typeof data === 'object' &&
    data !== null &&
    'id' in data &&
    'name' in data
  );
}

if (isUser(data)) {
  // data is User here
}
```

### Prefer Immutability
```typescript
// ✅ Good: Readonly types
interface Config {
  readonly apiUrl: string;
  readonly timeout: number;
}

// ✅ Good: Readonly arrays
const numbers: readonly number[] = [1, 2, 3];
// numbers.push(4); // Error: push doesn't exist on readonly array

// ✅ Good: as const for literal types
const config = {
  apiUrl: 'https://api.example.com',
  timeout: 5000
} as const;
```

## Performance

### Lazy Loading
```typescript
// Dynamic imports for code splitting
const loadModule = async () => {
  const module = await import('./heavyModule');
  return module.default;
};
```

### Type-Only Imports
```typescript
// Import only types (removed at runtime)
import type { User } from './types';

// Import both value and type
import { type User, createUser } from './user';
```

## Common Patterns

### Result Type
```typescript
type Result<T, E = Error> =
  | { success: true; data: T }
  | { success: false; error: E };

async function fetchUser(id: string): Promise<Result<User>> {
  try {
    const user = await api.getUser(id);
    return { success: true, data: user };
  } catch (error) {
    return { success: false, error: error as Error };
  }
}

// Usage
const result = await fetchUser('123');
if (result.success) {
  console.log(result.data.name);
} else {
  console.error(result.error.message);
}
```

### Builder Pattern
```typescript
class UserBuilder {
  private user: Partial<User> = {};
  
  setName(name: string): this {
    this.user.name = name;
    return this;
  }
  
  setEmail(email: string): this {
    this.user.email = email;
    return this;
  }
  
  build(): User {
    if (!this.user.name || !this.user.email) {
      throw new Error('Missing required fields');
    }
    return this.user as User;
  }
}

const user = new UserBuilder()
  .setName('John')
  .setEmail('john@example.com')
  .build();
```

## Key Principles

1. **Enable strict mode** - Maximum type safety
2. **Avoid `any`** - Use `unknown` or specific types
3. **Leverage type inference** - Don't over-annotate
4. **Use type guards** - Narrow types safely
5. **Prefer interfaces for objects** - Types for unions/intersections
6. **Keep types close to usage** - Co-locate types with code
7. **Test with types** - Ensure type safety in tests

---
**Last Updated**: 2025-11-02
