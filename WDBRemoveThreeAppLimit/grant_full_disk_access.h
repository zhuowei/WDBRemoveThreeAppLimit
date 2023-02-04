#pragma once
@import Foundation;

/// Uses CVE-2022-46689 to grant the current app read/write access outside the sandbox.
void grant_full_disk_access(void (^completion)(NSError* _Nullable));
bool patch_installd(void);
