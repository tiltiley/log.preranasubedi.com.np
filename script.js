document.addEventListener("DOMContentLoaded", () => {
  const emElements = document.querySelectorAll("em");

  emElements.forEach((em) => {
    const prevNode = em.previousSibling;
    const nextNode = em.nextSibling;

    // Ensure previous sibling is a text node and ends with '['
    if (prevNode && prevNode.nodeType === Node.TEXT_NODE) {
      const trimmedText = prevNode.textContent.trimEnd();
      if (trimmedText.endsWith("[")) {
        em.classList.add("inner-voice");
        prevNode.textContent = trimmedText.slice(0, -1); // Remove '['
      }
    }

    // Ensure next sibling is a text node and starts with ']'
    if (nextNode && nextNode.nodeType === Node.TEXT_NODE) {
      const trimmedText = nextNode.textContent.trimStart();
      if (trimmedText.startsWith("]")) {
        nextNode.textContent = trimmedText.slice(1); // Remove ']'
      }
    }
  });
});
