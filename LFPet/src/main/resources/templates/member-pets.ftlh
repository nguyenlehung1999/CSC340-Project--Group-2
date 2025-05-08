<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${member.memberUsername}'s Reported Pets</title>
    <link href="https://cdn.tailwindcss.com" rel="stylesheet">
</head>
<body class="bg-gray-100 text-gray-800 p-6 font-sans">
<div class="max-w-4xl mx-auto bg-white p-6 rounded shadow">
    <h1 class="text-2xl font-bold mb-4">${member.memberUsername}'s Reported Pets</h1>

    <#if pets?size == 0>
    <p class="text-gray-500">This member has not reported any pets.</p>
    <#else>
    <div class="grid grid-cols-1 gap-4">
        <#list pets as pet>
        <div class="border rounded p-4 flex gap-4 items-center bg-gray-50 hover:bg-gray-100">
            <img src="/images/${pet.imgPath!''}" alt="${pet.name!''}" class="w-24 h-24 object-cover rounded shadow">
            <div>
                <h2 class="text-lg font-semibold">${pet.name!''}</h2>
                <p class="text-sm text-gray-600">${pet.species!''} • ${pet.breed!''}</p>
                <p class="text-sm mt-1">${pet.description!''}</p>
                <p class="text-sm mt-1">
                    Status:
                    <span class="<#if pet.status>text-green-600<#else>text-red-600</#if> font-semibold">
                                    <#if pet.status>Found<#else>Missing</#if>
                    </span>
                </p>
                <a href="/communitymember/pet-details/${pet.petID}" class="text-blue-600 text-sm mt-2 inline-block">View Details</a>
            </div>
        </div>
    </#list>
</div>
</#if>
</div>
</body>
</html>
