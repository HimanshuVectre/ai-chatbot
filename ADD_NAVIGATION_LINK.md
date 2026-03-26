# Adding Navigation Link to Sales Chat

To make the Sales Chat easily accessible from your navigation menu, follow these steps:

## Option 1: Add to Authenticated Layout Navigation (Recommended)

Edit `resources/js/Layouts/AuthenticatedLayout.jsx` and find this section:

```jsx
<div className="hidden space-x-8 sm:-my-px sm:ms-10 sm:flex">
    <NavLink
        href={route('dashboard')}
        active={route().current('dashboard')}
    >
        Dashboard
    </NavLink>
    <NavLink
        href={route('chatbot')}
        active={route().current('chatbot')}
    >
        Chatbot
    </NavLink>
</div>
```

Add this line after the Chatbot link:

```jsx
<div className="hidden space-x-8 sm:-my-px sm:ms-10 sm:flex">
    <NavLink
        href={route('dashboard')}
        active={route().current('dashboard')}
    >
        Dashboard
    </NavLink>
    <NavLink
        href={route('chatbot')}
        active={route().current('chatbot')}
    >
        Chatbot
    </NavLink>
    <NavLink
        href={route('sales.chat')}
        active={route().current('sales.chat')}
    >
        Sales Assistant
    </NavLink>
</div>
```

## Option 2: Add to Mobile Responsive Menu

Find the responsive navigation section in the same file and add:

```jsx
<ResponsiveNavLink
    href={route('sales.chat')}
    active={route().current('sales.chat')}
>
    Sales Assistant
</ResponsiveNavLink>
```

Add it after the existing responsive links.

## Option 3: Add to Dashboard Page

Edit `resources/js/Pages/Dashboard.jsx` and add a card linking to the sales chat:

```jsx
<Link href={route('sales.chat')} className="inline-flex items-center px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
    Open Sales Assistant
</Link>
```

## Complete Navigation Example

Here's how your navigation should look with the Sales Chat link added:

```jsx
<div className="hidden space-x-8 sm:-my-px sm:ms-10 sm:flex">
    <NavLink
        href={route('dashboard')}
        active={route().current('dashboard')}
    >
        Dashboard
    </NavLink>
    <NavLink
        href={route('chatbot')}
        active={route().current('chatbot')}
    >
        Chatbot
    </NavLink>
    <NavLink
        href={route('sales.chat')}
        active={route().current('sales.chat')}
    >
        Sales Assistant
    </NavLink>
</div>
```

## Route Names Used

Make sure these route names are correct in your `routes/web.php`:

```php
Route::get('/sales/chat', [SalesConversationController::class, 'index'])
    ->name('sales.chat');  // ← This is the route name
```

## Available Routes

- `route('dashboard')` - Main dashboard
- `route('chatbot')` - Chatbot interface
- `route('sales.chat')` - Sales chat with conversation history
- `route('invoke-agent')` - API endpoint for agent calls

## Testing

After making changes:

1. Clear cache: `npm run dev` or `npm run build`
2. Reload the page in your browser
3. The "Sales Assistant" link should appear in the navigation
4. Clicking it should take you to `/sales/chat`

## Styling Notes

The navigation link will automatically show as:
- **Active** (highlighted) when on the sales chat page
- **Inactive** when on other pages
- **Responsive** - hides on mobile by default with hamburger menu

The styling uses Tailwind CSS classes defined in your project configuration.
