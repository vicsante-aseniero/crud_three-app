# CRUD Three App

Full-stack CRUD application scaffold using **Next.js (TypeScript)** for the frontend and **Rust** for the backend API, with a complete DevContainer development environment.

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                      DevContainer Environment                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────────┐     HTTP/REST     ┌──────────────────┐   │
│  │    Next.js UI    │ ◄───────────────► │    Rust API      │   │
│  │   (Port 3000)    │                   │   (Port 8000)    │   │
│  │   TypeScript     │                   │   Actix/Axum     │   │
│  └──────────────────┘                   └────────┬─────────┘   │
│                                                   │              │
│                                         ┌────────▼─────────┐   │
│                                         │  PostgreSQL DB   │   │
│                                         │   (Port 5432)    │   │
│                                         └──────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
               │                           │
               ▼                           ▼
        External Network: keycloak-dbs-brokers_backend_network
        (Keycloak, Redis, RabbitMQ, LocalStack)
```

## 📁 Project Structure

```
crud-three-app/
├── .devcontainer/           # DevContainer configuration
│   ├── devcontainer.json    # VS Code DevContainer settings
│   ├── docker-compose.yml   # Container orchestration
│   ├── Dockerfile           # Rust base image configuration
│   ├── postCreateCommand.sh # Post-creation setup script
│   ├── .env                 # Environment variables
│   └── init/
│       └── init.sql         # Database initialization
├── .github/
│   └── dependabot.yml       # Automated dependency updates
├── .vscode/
│   ├── extensions.json      # Recommended extensions
│   └── launch.json          # Debug configurations
├── api/                     # Rust Backend API
│   └── README.md            # API documentation
├── ui/                      # Next.js Frontend
│   └── README.md            # UI documentation
├── .gitignore               # Git ignore patterns
├── LICENSE                  # Project license
└── README.md                # This file
```

## 🛠️ Technology Stack

### Frontend (ui/)

| Technology         | Purpose                      |
| ------------------ | ---------------------------- |
| Next.js            | React framework with SSR/SSG |
| TypeScript         | Type-safe JavaScript         |
| TailwindCSS        | Utility-first CSS framework  |
| Jest               | Testing framework            |
| Playwright/Cypress | E2E testing                  |

### Backend (api/)

| Technology     | Purpose                      |
| -------------- | ---------------------------- |
| Rust           | Systems programming language |
| Actix-web/Axum | Web framework (choice)       |
| SQLx/Diesel    | Database ORM                 |
| cargo-watch    | Hot reloading                |
| cargo-nextest  | Testing runner               |

### Infrastructure

| Component      | Purpose                   |
| -------------- | ------------------------- |
| Docker Compose | Container orchestration   |
| PostgreSQL     | Primary database          |
| Redis          | Caching (external)        |
| RabbitMQ       | Message broker (external) |
| Keycloak       | Authentication (external) |
| LocalStack     | AWS services emulation    |

## 🚀 Getting Started

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop) (with Docker Compose)
- [VS Code](https://code.visualstudio.com/)
- [Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- External network running: `keycloak-dbs-brokers_backend_network`

### Quick Start

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd crud-three-app
   ```

2. **Ensure external network exists**

   ```bash
   # Create the network if it doesn't exist
   docker network create keycloak-dbs-brokers_backend_network
   ```

3. **Open in DevContainer**
   - Open VS Code in the project directory
   - Press `F1` and select **"Remote-Containers: Reopen in Container"**
   - Wait for the container to build and initialize

4. **Start development**

   ```bash
   # Terminal 1: Start the UI
   cd ui
   npm install
   npm run dev

   # Terminal 2: Start the API
   cd api
   cargo watch -x run
   ```

## ⚙️ DevContainer Features

The DevContainer includes these pre-configured tools:

### Rust Toolchain

- `rust-analyzer` - IDE support
- `rustfmt` - Code formatting
- `clippy` - Linting
- `cargo-watch` - Hot reloading
- `cargo-nextest` - Test runner
- `cargo-audit` - Security audits
- `cargo-llvm-cov` - Code coverage

### Node.js Toolchain

- Node.js LTS with npm, pnpm, yarn
- TypeScript globally installed
- NestJS CLI
- Prisma CLI
- Tailwind CSS CLI

### Additional Tools

- Protocol Buffers compiler (`protoc`)
- Dapr CLI for microservices
- PostgreSQL client (v13)
- LocalStack with AWS CLI
- Postman for API testing

## 🔧 VS Code Configuration

### Debug Configurations

| Configuration             | Description                                    |
| ------------------------- | ---------------------------------------------- |
| Debug UI                  | Launch Chrome debugger for Next.js (port 3000) |
| Debug UI (Firefox)        | Launch Firefox debugger for Next.js            |
| Debug API                 | Launch debugger for API (port 8000)            |
| Next.js: debug UI         | Terminal-based Next.js debugging               |
| Next.js: debug full stack | Full stack debugging with inspector            |

### Recommended Extensions

The workspace includes 35+ recommended extensions for:

- Rust development (rust-analyzer, LLDB debugger)
- TypeScript/JavaScript development
- Docker and container management
- Database tools (PostgreSQL, Redis)
- AI assistance (Copilot, Claude, Codeium)
- Testing (Jest, Playwright, Cypress)

## 📦 Environment Variables

Located in `.devcontainer/.env`:

| Variable            | Description       | Default     |
| ------------------- | ----------------- | ----------- |
| `POSTGRES_DB`       | Database name     | `postgres`  |
| `POSTGRES_USER`     | Database user     | `postgres`  |
| `POSTGRES_PASSWORD` | Database password | (see .env)  |
| `POSTGRES_HOSTNAME` | Database host     | `localhost` |

## 🔌 Port Mappings

| Port  | Service             |
| ----- | ------------------- |
| 3000  | Next.js Frontend    |
| 5432  | PostgreSQL          |
| 5672  | RabbitMQ            |
| 6274  | Reserved            |
| 6277  | Reserved            |
| 6379  | Redis               |
| 8000  | Rust API            |
| 8080  | Additional service  |
| 9000  | LocalStack          |
| 15672 | RabbitMQ Management |

## 🧪 Testing

### Frontend (Next.js)

```bash
cd ui
npm test           # Run Jest tests
npm run test:e2e   # Run Playwright/Cypress E2E tests
npm run test:cov   # Run tests with coverage
```

### Backend (Rust)

```bash
cd api
cargo test                  # Run tests
cargo nextest run           # Run tests with nextest
cargo llvm-cov              # Run tests with coverage
cargo audit                 # Security audit
```

## 📚 Additional Documentation

- [ANALYSIS.md](./ANALYSIS.md) - Detailed technical analysis
- [api/README.md](./api/README.md) - Backend API documentation
- [ui/README.md](./ui/README.md) - Frontend UI documentation

## 🔐 Security

- DevContainer runs as non-root user (`vscode`)
- Dependabot enabled for automated security updates
- `cargo-audit` included for Rust dependency scanning
- External network isolation for services

## 📝 License

This project is licensed under the terms specified in the [LICENSE](./LICENSE) file.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and linting
5. Submit a pull request

---

**Built with ❤️ using Next.js + TypeScript and Rust**
