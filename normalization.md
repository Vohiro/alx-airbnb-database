# Normalizing the Database Design

- **Check redundancy step by step:**
    - **1NF:** Ensure no multi-valued attributes. (e.g., a property has one address only, not multiple stored in one column).

    - **2NF:** Ensure every non-key attribute depends on the whole PK (e.g., in booking, check_in depends on booking_id, not user_id alone).

    - **3NF:** Ensure no transitive dependencies (e.g., don’t store owner_email inside property since you already have owner_id linking to User).