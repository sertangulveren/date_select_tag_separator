On the Ruby on Rails, ActionView has the method ```date_select``` provides us the inputs of date items as day, month and year. Each date item has its own input element.

### Example:
You can see the example of form input for date_select as follows:
```html+erb
<%= f.date_select :birthday, { start_year: 1923, end_year: Date.current.year - 15 }, class: 'date-item' %>
```

The output of this example would be as follows:
```html
<!-- input for day -->
<select id="user_birthday_1i" name="user[birthday(1i)]" class="date-item">
    <option value="1923">1923</option>
    <!-- ... -->
    <!-- huge list of years -->
    <!-- ... -->
    <option value="2006">2006</option>
</select>

<!-- ----------------------------------------------------------------- -->

<!-- input for month -->
<select id="user_birthday_2i" name="user[birthday(2i)]" class="date-item">
    <option value="1">January</option>
    <!-- ... -->
    <!-- huge list of months -->
    <!-- ... -->
    <option value="12">December</option>
</select>

<!-- ----------------------------------------------------------------- -->

<!-- input for year -->
<select id="user_birthday_3i" name="user[birthday(3i)]" class="date-item">
    <option value="1">1</option>
    <!-- ... -->
    <!-- huge list of days -->
    <!-- ... -->
    <option value="31">31</option>
</select>
```

As you can see, ```date_select``` method created 3 ```select``` element with options for each date item.

If you want to create all inputs of date items in a specific html tag, you can create an initializer in your rails projects like [this](date_select_separation.rb) or if you are lazy, you can run this curl command in your project directory:
```bash
curl -o config/initializers/date_select_separation.rb https://raw.githubusercontent.com/sertangulveren/date_select_tag_separator/master/date_select_separation.rb
```
It overrides ```ActionView::Helpers::DateTimeSelector#build_selects_from_types``` method and divides the separation process into two methods.

If your initializer is ready, you can use the ```tag_separator``` option as follows:

```html+erb
<%= f.date_select :birthday,
                  { default: 18.years.ago.to_date, locale: I18n.locale,
                    start_year: 1900, end_year: 18.years.ago.year,
                    order: [:day, :month, :year],
                    tag_separator: { name: :div, options: { class: 'col' } } },
                  class: 'form-control' %>
```

This will creates a ```div``` element with the ```col```  class and inserts the inputs of each date items into div element. The output of this would be as follows:

```html
<div class="col">
    <select id="user_birthday_3i" name="user[birthday(3i)]" class="form-control">
        <option value="1">1</option>
        <!-- ... -->
        <!-- huge list of days -->
        <!-- ... -->
        <option value="31">31</option>
    </select>
</div>
<div class="col">
    <select id="user_birthday_2i" name="user[birthday(2i)]" class="form-control">
        <option value="1">January</option>
        <!-- ... -->
        <!-- huge list of months -->
        <!-- ... -->
        <option value="12">December</option>
    </select>
</div>
<div class="col">
    <select id="user_birthday_1i" name="user[birthday(1i)]" class="form-control">
        <option value="1923">1923</option>
        <!-- ... -->
        <!-- huge list of years -->
        <!-- ... -->
        <option value="2006">2006</option>
    </select>
</div>
```

Now your project has become even more perfect 🤓
