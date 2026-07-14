# Nice work

A `default-deny` NetworkPolicy with an empty pod selector applied to every pod and blocked all ingress, cutting off the `web` app. Removing it restored access.

Honesty note: this single-node backend's CNI may not actually enforce NetworkPolicy at the packet level, so this lab grades the policy STATE - that the deny-all is gone - rather than live connectivity. The diagnosis skill (read the selector and policyTypes, understand deny-all) is exactly the same on a cluster where enforcement is real.
