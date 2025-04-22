# Features

1. Conventional Commits:

   - Adding an emoji
   - Adding issue ID from branch name (if exist)
   - Saving exist scopes from message

2. Non-Conventional Commits:

   - Adding issue ID from branch name (if exist)
   - In other cases, the message remains unchanged

3. Special cases:
   - Saving breaking changes (`!`)
   - Existing issue ID in scope will not be duplicated
   - Multiple scopes are separated by commas

# Examples

| Type                            | Branch                           | Input                                | Output                                             |
| ------------------------------- | -------------------------------- | ------------------------------------ | -------------------------------------------------- |
| **Base**                        | feature/INFS-7777-my-new-feature | feat: add new button                 | ✨ feat(INFS-7777): add new button                 |
|                                 | just-branch                      | feat: add new button                 | ✨ feat: add new button                            |
| **Breaking change**             | feature/INFS-7777-my-new-feature | feat!: add new button                | ✨ feat!(INFS-7777): add new button                |
|                                 | just-branch                      | feat!: add new button                | ✨ feat!: add new button                           |
| **Already with task**           | feature/INFS-7777-my-new-feature | feat(INFS-7777): add new button      | ✨ feat(INFS-7777): add new button                 |
|                                 | just-branch                      | feat(INFS-7777): add new button      | ✨ feat(INFS-7777): add new button                 |
| **With custom scope**           | feature/INFS-7777-my-new-feature | feat(scope): add new button          | ✨ feat(scope, INFS-7777): add new button          |
|                                 | just-branch                      | feat(scope): add new button          | ✨ feat(scope): add new button                     |
| **With many scopes**            | feature/INFS-7777-my-new-feature | feat(scope1, scope2): add new button | ✨ feat(scope1, scope2, INFS-7777): add new button |
|                                 | just-branch                      | feat(scope1, scope2): add new button | ✨ feat(scope1, scope2): add new button            |
| **No conventional**             | feature/INFS-7777-my-new-feature | add new button                       | INFS-7777: add new button                          |
|                                 | just-branch                      | add new button                       | add new button                                     |
| **No conventional (with task)** | feature/INFS-7777-my-new-feature | INFS-7777: add new button            | INFS-7777: add new button                          |
|                                 | just-branch                      | INFS-7777: add new button            | INFS-7777: add new button                          |
