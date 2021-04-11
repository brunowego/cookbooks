# Flask Route

##

```py
@app.route('/imports', methods=['POST'])
def imports():
    try:
        result = db.session.execute(f"""""").fetchone()[0]
        db.session.commit()
    except sqlalchemy.exc.InternalError:
        db.session.rollback()
        return {}, 400
    except sqlalchemy.exc.IntegrityError:
        db.session.rollback()
        return {}, 400
    except sqlalchemy.exc.DataError:
        db.session.rollback()
        return {}, 400

    return result, 201
```
