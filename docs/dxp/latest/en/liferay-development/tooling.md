---
toc:
  - ./tooling/liferay-workspace.md
  - ./tooling/blade-cli.md
  - ./tooling/poshi-test-automation.md
  - ./tooling/other-tools.md
  - ./tooling/reference.md
uuid: 61624733-2570-4d8a-873b-d66a51539bf0
taxonomy-category-names:
- Development and Tooling
- Developer Tools
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Tooling

Liferay provides a variety of developer tools that include standard build scripting, lightweight CLI utilities, and full IDE based on Eclipse. This is to serve all developers, whether you're starting out or have been writing code for many years. All of Liferay's development tools work on Linux, Mac, and Windows platforms.

## Lightweight Tools

If you're an experienced developer or prefer integrating Liferay development into an existing tool set, our CLI and file system-based tools can help. 

[**Liferay Workspace**](./tooling/liferay-workspace.md) is a Gradle-based environment that holds your projects and their configurations. You can deploy to Liferay DXP, create and store Docker configurations, and perform all your DevOps from this single environment. It's flexible enough to enable developers of all stripes to integrate it with existing tools and workflows. 

[**Blade CLI**](./tooling/blade-cli.md) makes it easy to create and build Liferay Workspaces, projects, and start and stop servers from your command line interface. Developers can make use of this small, simple CLI tool to integrate Liferay projects into their existing workflows. 

## Tools for Frontend Developers

If you're a frontend developer, two CLI-based tools can help you create theme projects to transform Liferay's look and feel, as well as widget projects. 

**Liferay Theme Generator** helps frontend developers create themes and layout templates to define the look and feel of your Liferay DXP-based site.

**Liferay JS Generator** creates projects for JavaScript-based widgets deployable to Liferay DXP.

## IDEs and Plugins

If you use JetBrains's IntelliJ IDEA or Eclipse, Liferay has graphical tools that integrate with them. 

**Liferay IntelliJ Plugin** provides support for using Liferay Workspaces and standalone projects in IntelliJ IDEA.

**Liferay Developer Studio** is an Eclipse-based IDE that supports the full scope of Liferay development.

Under the hood, Liferay Workspace is powered by a multitude of Gradle and Maven plugins you can apply to your projects. There are also project templates and samples to get you started.

If you've followed any of the sample projects provided with the developer documentation, you've already used Liferay Workspace. Now you can learn the full scope of its functionality to create your own projects. From there, you can use Blade CLI to manage projects from your terminal. IntelliJ users can use the IntelliJ plugin, and if you want a full-featured environment that includes everything you need, install Liferay Developer Studio.

We hope you'll enjoy using Liferay's development tools with your Liferay projects!
