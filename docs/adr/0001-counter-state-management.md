# ADR 0001 - Counter state management

## Context
App is a demo, keep state local to the widget.
## Decision
Use StatefullWidget + setate() for state management.

## Consequences
Simple, wont scale to a large app or an app with a large number of states - suitable for a demo.